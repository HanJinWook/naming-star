import 'package:flutter/material.dart';
import '../data/hanja.dart';
import '../data/hanja_full.dart';
import '../engine/pure_korean.dart';
import '../engine/saju.dart';
import '../engine/scoring.dart';
import '../models.dart';
import '../services/ad_service.dart';
import '../theme.dart';
import '../widgets/common.dart';
import '../widgets/surname_picker.dart';
import 'detail_screen.dart';

/// 음절의 전체 한자를 curated 우선으로 정렬
List<HanjaPick> orderedHanja(String syllable) {
  final full = hanjaFullBySyllable[syllable] ?? [];
  final curatedOrder =
      hanjaBySyllable[syllable]?.map((e) => e.char).toList() ?? [];
  final curatedSet = curatedOrder.toSet();
  final curated =
      full.where((e) => curatedSet.contains(e.char)).toList();
  final rest =
      full.where((e) => !curatedSet.contains(e.char)).toList();
  curated.sort((a, b) => curatedOrder
      .indexOf(a.char)
      .compareTo(curatedOrder.indexOf(b.char)));
  rest.sort((a, b) => a.strokes.compareTo(b.strokes));
  return [...curated, ...rest];
}

/// 직접 이름 분석 — 이미 정한 이름을 입력해 평가
class AnalyzeScreen extends StatefulWidget {
  const AnalyzeScreen({super.key});

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  final _givenCtrl = TextEditingController();
  SurnamePick _surnamePick =
      const SurnamePick(name: '김', hanja: '金', strokes: 8);
  Gender _gender = Gender.boy;
  DateTime _birth = DateTime(2026, 10, 19);
  TimeOfDay? _birthTime;
  bool _timeUnknown = false;
  bool _isPureKorean = false;
  // 음절별 선택된 한자 인덱스
  final Map<int, int> _hanjaIdx = {};

  @override
  void dispose() {
    _givenCtrl.dispose();
    super.dispose();
  }

  Future<void> _chooseSurname() async {
    final pick = await showSurnamePicker(context, _surnamePick);
    if (pick != null) {
      setState(() => _surnamePick = pick);
    }
  }

  List<String> get _syllables =>
      _givenCtrl.text.trim().split('').where((c) => c.trim().isNotEmpty).toList();

  void _analyze() {
    final syls = _syllables;
    if (syls.length != 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(_isPureKorean
                ? '순우리말 이름 2자를 입력해주세요. (예: 하늘)'
                : '이름 2자를 입력해주세요. (예: 도윤)')),
      );
      return;
    }
    // 한글 음절 확인 (순우리말 모드)
    if (_isPureKorean) {
      final hangul = RegExp(r'^[가-힣]{2}$');
      if (!hangul.hasMatch(syls.join())) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('한글 2자로 입력해주세요.')),
        );
        return;
      }
    }
    final baby = BabyInfo(
      surname: _surnamePick.name,
      surnameHanja: _surnamePick.hanja,
      surnameStrokes: _surnamePick.strokes,
      gender: _gender,
      birth: _birth,
      birthHour: _timeUnknown ? null : _birthTime?.hour,
      birthMinute: _timeUnknown ? null : _birthTime?.minute,
    );
    final saju = computeSaju(baby);
    final NameAnalysis analysis;
    if (_isPureKorean) {
      analysis = analyzePureKoreanName(
        surname: _surnamePick.name,
        surnameStrokes: _surnamePick.strokes,
        givenName: syls.join(),
        saju: saju,
        gender: _gender,
      );
    } else {
      final picks = <HanjaPick>[];
      for (var i = 0; i < 2; i++) {
        final opts = orderedHanja(syls[i]);
        if (opts.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('\'${syls[i]}\' 음절의 한자 데이터가 없어요.')),
          );
          return;
        }
        final idx = (_hanjaIdx[i] ?? 0).clamp(0, opts.length - 1);
        picks.add(opts[idx]);
      }
      analysis = analyzeName(
        surname: _surnamePick.name,
        surnameStrokes: _surnamePick.strokes,
        picks: picks,
        saju: saju,
        gender: _gender,
      );
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(baby: baby, analysis: analysis),
      ),
    );
  }

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _birth,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2035),
      locale: const Locale('ko'),
    );
    if (d != null) setState(() => _birth = d);
  }

  Future<void> _pickTime() async {
    final t = await showTimePicker(
      context: context,
      initialTime: _birthTime ?? const TimeOfDay(hour: 12, minute: 0),
    );
    if (t != null) {
      setState(() {
        _birthTime = t;
        _timeUnknown = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final syls = _syllables;

    return Scaffold(
      appBar: AppBar(title: const Text('이름 직접 분석하기')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            20, 20, 20, 20 + MediaQuery.of(context).padding.bottom),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('분석할 이름',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  // 성씨 선택기
                  InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: _chooseSurname,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppTheme.primarySoft,
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _surnamePick.hanja.isEmpty
                                ? _surnamePick.name
                                : '${_surnamePick.name}(${_surnamePick.hanja})',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.primary),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${_surnamePick.strokes}획',
                            style: const TextStyle(
                                fontSize: 13,
                                color: AppTheme.sub,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          const Text('성씨 변경',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppTheme.primary,
                                  fontWeight: FontWeight.w600)),
                          const Icon(Icons.chevron_right,
                              size: 18,
                              color: AppTheme.primary),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _givenCtrl,
                    maxLength: 2,
                    decoration: InputDecoration(
                        hintText: _isPureKorean
                            ? '순우리말 이름 2자 (예: 하늘)'
                            : '이름 2자 (예: 도윤)',
                        counterText: ''),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    onChanged: (_) =>
                        setState(() => _hanjaIdx.clear()),
                  ),
                  const SizedBox(height: 12),
                  // 이름 종류 선택
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(
                          value: false,
                          label: Text('한자 이름'),
                          icon: Icon(Icons.text_fields, size: 18)),
                      ButtonSegment(
                          value: true,
                          label: Text('순우리말'),
                          icon: Icon(Icons.grass_outlined, size: 18)),
                    ],
                    selected: {_isPureKorean},
                    onSelectionChanged: (s) => setState(() {
                      _isPureKorean = s.first;
                      _hanjaIdx.clear();
                    }),
                  ),
                  if (_isPureKorean) ...[
                    const SizedBox(height: 8),
                    const Text(
                      '순우리말 이름은 한자 획수 대신 한글 자모 획수로 수리를 계산하고, 초성의 발음오행으로 사주를 보완하는 간이 분석이에요.',
                      style:
                          TextStyle(fontSize: 11, color: AppTheme.sub),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          // 성별
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('성별',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GenderButton(
                          label: '남아',
                          icon: Icons.boy,
                          color: AppTheme.boy,
                          selected: _gender == Gender.boy,
                          onTap: () =>
                              setState(() => _gender = Gender.boy),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GenderButton(
                          label: '여아',
                          icon: Icons.girl,
                          color: AppTheme.girl,
                          selected: _gender == Gender.girl,
                          onTap: () =>
                              setState(() => _gender = Gender.girl),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 한자 선택 (순우리말 모드에서는 숨김)
          if (syls.length == 2 && !_isPureKorean)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('한자 선택',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    const Text('각 음절에 쓸 한자를 고르세요.',
                        style: TextStyle(
                            fontSize: 12, color: AppTheme.sub)),
                    const SizedBox(height: 12),
                    for (var i = 0; i < 2; i++) ...[
                      Text(
                          '${syls[i]} (${orderedHanja(syls[i]).length}개 한자)',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Container(
                        constraints:
                            const BoxConstraints(maxHeight: 168),
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: orderedHanja(syls[i])
                                .asMap()
                                .entries
                                .map((e) {
                              final sel =
                                  (_hanjaIdx[i] ?? 0) == e.key;
                              final label = e.value.meaning
                                      .isNotEmpty
                                  ? '${e.value.char} ${e.value.meaning}'
                                  : '${e.value.char} ${e.value.strokes}획';
                              return ChoiceChip(
                                label: Text(label),
                                selected: sel,
                                onSelected: (_) => setState(
                                    () => _hanjaIdx[i] = e.key),
                                selectedColor:
                                    AppTheme.primarySoft,
                                avatar: ElementChip(
                                    e.value.element),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      if (i == 0) const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),
          // 생년월일시
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('생년월일시',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.cake_outlined,
                        color: AppTheme.primary),
                    title: Text(
                        '${_birth.year}년 ${_birth.month}월 ${_birth.day}일',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: _pickDate,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.schedule,
                        color: AppTheme.primary),
                    title: Text(
                        '태어난 시간 · ${_timeUnknown
                            ? '모름'
                            : (_birthTime == null
                                ? '선택 안 함'
                                : '${_birthTime!.hour}시 ${_birthTime!.minute}분')}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: _pickTime,
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity:
                        ListTileControlAffinity.leading,
                    title: const Text(
                        '태어난 시간을 몰라요',
                        style: TextStyle(fontSize: 13)),
                    value: _timeUnknown,
                    onChanged: (v) =>
                        setState(() => _timeUnknown = v ?? false),
                  ),
                  const Text(
                      '사주 분석에 활용해요. 시간을 모르면 시주를 제외하고 분석합니다.',
                      style:
                          TextStyle(fontSize: 11, color: AppTheme.sub)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _analyze,
            child: const Text('이 이름 분석하기'),
          ),
          const SizedBox(height: 12),
          const Text(
            '수리·음양·발음·사주 보완·사용성 5개 차원으로 점수화해 드려요.',
            style: TextStyle(fontSize: 11, color: AppTheme.sub),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          // 하단 배너 광고
          const Center(
              child: BannerAdWidget(placement: AdPlacement.analyze)),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
