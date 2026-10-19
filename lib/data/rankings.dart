// 신생아 이름 랭킹 데이터
// 출처: 대한민국 법원 전자가족관계등록시스템 출생신고 이름 통계 (2024년 연간)

class RankEntry {
  final int rank;
  final String name;
  final int count;
  const RankEntry(this.rank, this.name, this.count);
}

const String rankingSource = '법원 전자가족관계등록시스템 출생신고 이름 통계 (2024년 연간)';

const List<RankEntry> boyRanking2024 = [
  RankEntry(1, '이준', 1771),
  RankEntry(2, '하준', 1687),
  RankEntry(3, '도윤', 1653),
  RankEntry(4, '은우', 1536),
  RankEntry(5, '시우', 1501),
  RankEntry(6, '서준', 1472),
  RankEntry(7, '선우', 1397),
  RankEntry(8, '유준', 1350),
  RankEntry(9, '태오', 1324),
  RankEntry(10, '이안', 1319),
  RankEntry(11, '수호', 1316),
  RankEntry(12, '도현', 1283),
  RankEntry(13, '이현', 1257),
  RankEntry(14, '지호', 1251),
  RankEntry(15, '도하', 1217),
  RankEntry(16, '우주', 1202),
  RankEntry(17, '예준', 1106),
  RankEntry(18, '주원', 1012),
  RankEntry(19, '지한', 996),
  RankEntry(20, '로운', 994),
];

const List<RankEntry> girlRanking2024 = [
  RankEntry(1, '이서', 1831),
  RankEntry(2, '서아', 1802),
  RankEntry(3, '하린', 1409),
  RankEntry(4, '지유', 1352),
  RankEntry(5, '하윤', 1329),
  RankEntry(6, '지안', 1325),
  RankEntry(7, '아윤', 1322),
  RankEntry(8, '지아', 1287),
  RankEntry(9, '시아', 1209),
  RankEntry(10, '아린', 1200),
  RankEntry(11, '서윤', 1192),
  RankEntry(12, '지우', 1071),
  RankEntry(13, '유나', 988),
  RankEntry(14, '유주', 975),
  RankEntry(15, '채아', 938),
  RankEntry(16, '윤슬', 936),
  RankEntry(17, '윤서', 934),
  RankEntry(18, '수아', 930),
  RankEntry(19, '서하', 911),
  RankEntry(20, '리아', 885),
];

// 2025년 월간 트렌드 요약 (2025년 2월 기준, 가장 최근 공개 자료)
const String trend2025 =
    '2025년 들어 남자 이름은 도윤·시우·태오가 이준·하준을 추월했고 은호가 급상승 중이에요. '
    '여자 이름은 서아·이서 1·2위 체제가 유지되고 지안이 상승세예요.';

// 이름 → 랭킹 순위 조회 (남/여 각각, 없으면 null)
int? boyRankOf(String name) {
  for (final r in boyRanking2024) {
    if (r.name == name) return r.rank;
  }
  return null;
}

int? girlRankOf(String name) {
  for (final r in girlRanking2024) {
    if (r.name == name) return r.rank;
  }
  return null;
}
