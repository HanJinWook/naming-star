import '../data/hanja.dart';
import '../models.dart';
import 'scoring.dart';

/// 성별별 이름 음절 풀 (첫자 × 끝자)
const List<String> _boyFirst = [
  '준', '도', '하', '시', '현', '민', '재', '건', '태', '경',
  '호', '혁', '석', '규', '동', '훈', '선', '주', '원', '이', '지',
];
const List<String> _boySecond = [
  '준', '우', '현', '민', '재', '건', '혁', '석', '훈', '율',
  '한', '온', '안', '오', '원', '주', '로', '빈',
];
const List<String> _girlFirst = [
  '서', '하', '윤', '지', '유', '은', '채', '예', '소', '미',
  '다', '보', '단', '희', '아', '연', '나', '이', '리', '시',
];
const List<String> _girlSecond = [
  '서', '아', '윤', '하', '은', '지', '유', '연', '예', '나',
  '린', '소', '미', '리', '원', '주', '안', '다',
];

/// 용신/희신 매칭 우선으로 한자 후보 정렬 후 상위 2개만 사용
List<HanjaEntry> _topHanja(String syllable, SajuResult saju) {
  final opts = hanjaBySyllable[syllable];
  if (opts == null || opts.isEmpty) return [];
  final sorted = List<HanjaEntry>.of(opts);
  sorted.sort((a, b) {
    int w(HanjaEntry h) {
      if (h.element == saju.yongsin) return 0;
      if (h.element == saju.huishin) return 1;
      return 2;
    }
    final c = w(a).compareTo(w(b));
    if (c != 0) return c;
    return a.strokes.compareTo(b.strokes);
  });
  return sorted.take(2).toList();
}

bool _hasBadWord(String name) {
  for (final w in badWords) {
    if (name.contains(w)) return true;
  }
  return false;
}

/// 후보 이름 생성 → 분석 → 상위 N개 반환
List<NameAnalysis> generateNames(
  BabyInfo baby,
  SajuResult saju, {
  int limit = 60,
}) {
  final firsts = baby.gender == Gender.boy ? _boyFirst : _girlFirst;
  final seconds = baby.gender == Gender.boy ? _boySecond : _girlSecond;
  final best = <String, NameAnalysis>{};

  for (final f in firsts) {
    for (final s in seconds) {
      if (f == s) continue;
      final given = '$f$s';
      if (awkwardPairs.contains(given)) continue;
      final full = '${baby.surname}$given';
      if (_hasBadWord(full)) continue;
      final fOpts = _topHanja(f, saju);
      final sOpts = _topHanja(s, saju);
      if (fOpts.isEmpty || sOpts.isEmpty) continue;

      NameAnalysis? top;
      for (final fh in fOpts) {
        for (final sh in sOpts) {
          final a = analyzeName(
            surname: baby.surname,
            surnameStrokes: baby.surnameStrokes,
            picks: [fh, sh],
            saju: saju,
            gender: baby.gender,
          );
          if (top == null || a.total > top.total) top = a;
        }
      }
      if (top != null) {
        final prev = best[given];
        if (prev == null || top.total > prev.total) best[given] = top;
      }
    }
  }

  final list = best.values.toList()
    ..sort((a, b) => b.total.compareTo(a.total));
  return list.take(limit).toList();
}
