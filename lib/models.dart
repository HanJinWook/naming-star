// 작명별 공통 모델

enum Gender { boy, girl }

extension GenderX on Gender {
  String get label => this == Gender.boy ? '남아' : '여아';
}

/// 아기 기본 정보
class BabyInfo {
  final String surname;
  final String surnameHanja; // ''이면 미상/직접입력
  final int surnameStrokes;
  final Gender gender;
  final DateTime birth;
  final int? birthHour; // null이면 모름
  final int? birthMinute;

  const BabyInfo({
    required this.surname,
    this.surnameHanja = '',
    required this.surnameStrokes,
    required this.gender,
    required this.birth,
    this.birthHour,
    this.birthMinute,
  });

  bool get timeUnknown => birthHour == null;

  Map<String, dynamic> toJson() => {
        'surname': surname,
        'surnameHanja': surnameHanja,
        'surnameStrokes': surnameStrokes,
        'gender': gender.name,
        'birth': birth.toIso8601String(),
        'birthHour': birthHour,
        'birthMinute': birthMinute,
      };

  factory BabyInfo.fromJson(Map<String, dynamic> j) => BabyInfo(
        surname: j['surname'] as String,
        surnameHanja: j['surnameHanja'] as String? ?? '',
        surnameStrokes: j['surnameStrokes'] as int,
        gender: (j['gender'] as String) == 'boy' ? Gender.boy : Gender.girl,
        birth: DateTime.parse(j['birth'] as String),
        birthHour: j['birthHour'] as int?,
        birthMinute: j['birthMinute'] as int?,
      );
}

/// 사주 기둥 하나 (천간 + 지지)
class SajuPillar {
  final String stem; // 갑을병정...
  final String branch; // 자축인묘...
  const SajuPillar(this.stem, this.branch);
  String get label => '$stem$branch';
}

/// 사주 분석 결과 (간이 만세력)
class SajuResult {
  final SajuPillar year;
  final SajuPillar month;
  final SajuPillar day;
  final SajuPillar? hour; // null이면 시간 모름
  final String dayMaster; // 일간
  final String dayElement; // 일간 오행 (목화토금수)
  final Map<String, int> elementCounts; // 오행별 개수 (8자 기준)
  final bool strongBody; // 신강 여부
  final String? yongsin; // 용신 오행
  final String? huishin; // 희신 오행
  final String? johu; // 조후 필요 오행
  final List<String> notes; // 간이 분석 한계 안내

  const SajuResult({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.dayMaster,
    required this.dayElement,
    required this.elementCounts,
    required this.strongBody,
    required this.yongsin,
    required this.huishin,
    required this.johu,
    required this.notes,
  });
}

/// 이름 한 글자에 매칭된 한자
class HanjaPick {
  final String syllable; // 한글 음절
  final String char; // 한자
  final int strokes; // 원획
  final String element; // 자원오행 (목화토금수)
  final String meaning; // 뜻풀이
  final bool disputed; // 학파별 상이 가능

  const HanjaPick({
    required this.syllable,
    required this.char,
    required this.strokes,
    required this.element,
    required this.meaning,
    this.disputed = false,
  });

  Map<String, dynamic> toJson() => {
        'syllable': syllable,
        'char': char,
        'strokes': strokes,
        'element': element,
        'meaning': meaning,
      };

  factory HanjaPick.fromJson(Map<String, dynamic> j) => HanjaPick(
        syllable: j['syllable'] as String,
        char: j['char'] as String,
        strokes: j['strokes'] as int,
        element: j['element'] as String,
        meaning: j['meaning'] as String,
      );
}

/// 5개 평가 차원 중 하나
class DimensionScore {
  final String key; // suri, yinyang, sound, resource, usability
  final String title; // 수리, 음양, 발음, 사주 보완, 사용성
  final double score; // 0~100
  final String grade; // 대길/길/반길반흉/흉 등
  final String summary; // 한 줄 요약
  final List<String> details; // 상세 풀이

  const DimensionScore({
    required this.key,
    required this.title,
    required this.score,
    required this.grade,
    required this.summary,
    required this.details,
  });
}

/// 이름 종합 분석 결과
class NameAnalysis {
  final String surname;
  final List<HanjaPick> picks; // 이름 2자
  final double total;
  final DimensionScore suri;
  final DimensionScore yinyang;
  final DimensionScore sound;
  final DimensionScore resource;
  final DimensionScore usability;
  final SajuResult saju;
  final List<String> warnings;
  final int? rankBoy; // 남자 랭킹 순위 (해당 시)
  final int? rankGirl; // 여자 랭킹 순위 (해당 시)

  const NameAnalysis({
    required this.surname,
    required this.picks,
    required this.total,
    required this.suri,
    required this.yinyang,
    required this.sound,
    required this.resource,
    required this.usability,
    required this.saju,
    required this.warnings,
    this.rankBoy,
    this.rankGirl,
  });

  String get givenName => picks.map((p) => p.syllable).join();
  String get fullName => '$surname$givenName';
  String get hanjaName => picks.map((p) => p.char).join();
  List<DimensionScore> get dimensions =>
      [suri, resource, sound, yinyang, usability];
}
