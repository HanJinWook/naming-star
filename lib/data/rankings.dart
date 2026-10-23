// 신생아 이름 랭킹 데이터 (2016~2025, 연도별)
// 출처: 대한민국 법원 전자가족관계등록시스템 출생신고 이름 통계 (연도별 연간 집계)
// 건수는 집계 시점에 따라 공식 발표 잠정치와 조금 다를 수 있어요.

class RankEntry {
  final int rank;
  final String name;
  final int count;
  const RankEntry(this.rank, this.name, this.count);
}

class YearRanking {
  final List<RankEntry> boy;
  final List<RankEntry> girl;
  const YearRanking({required this.boy, required this.girl});
}

const Map<int, YearRanking> rankingsByYear = {
  2016: YearRanking(
    boy: [
      RankEntry(1, '민준', 2952),
      RankEntry(2, '서준', 2878),
      RankEntry(3, '하준', 2878),
      RankEntry(4, '도윤', 2780),
      RankEntry(5, '예준', 2523),
      RankEntry(6, '주원', 2509),
      RankEntry(7, '지호', 2159),
      RankEntry(8, '시우', 2149),
      RankEntry(9, '준우', 1929),
      RankEntry(10, '유준', 1824),
      RankEntry(11, '지후', 1761),
      RankEntry(12, '도현', 1632),
      RankEntry(13, '서진', 1572),
      RankEntry(14, '준서', 1562),
      RankEntry(15, '시윤', 1538),
      RankEntry(16, '건우', 1518),
      RankEntry(17, '현우', 1473),
      RankEntry(18, '선우', 1446),
      RankEntry(19, '지훈', 1427),
      RankEntry(20, '연우', 1426),
    ],
    girl: [
      RankEntry(1, '서윤', 2798),
      RankEntry(2, '서연', 2525),
      RankEntry(3, '하윤', 2404),
      RankEntry(4, '지유', 2400),
      RankEntry(5, '지우', 2337),
      RankEntry(6, '하은', 2059),
      RankEntry(7, '지아', 1970),
      RankEntry(8, '수아', 1942),
      RankEntry(9, '서현', 1870),
      RankEntry(10, '하린', 1798),
      RankEntry(11, '민서', 1761),
      RankEntry(12, '다은', 1755),
      RankEntry(13, '채원', 1748),
      RankEntry(14, '서우', 1708),
      RankEntry(15, '윤서', 1595),
      RankEntry(16, '지안', 1565),
      RankEntry(17, '소율', 1531),
      RankEntry(18, '서아', 1507),
      RankEntry(19, '지윤', 1464),
      RankEntry(20, '예린', 1421),
    ],
  ),
  2017: YearRanking(
    boy: [
      RankEntry(1, '하준', 2670),
      RankEntry(2, '도윤', 2633),
      RankEntry(3, '서준', 2406),
      RankEntry(4, '시우', 2297),
      RankEntry(5, '민준', 2208),
      RankEntry(6, '주원', 2107),
      RankEntry(7, '예준', 2094),
      RankEntry(8, '유준', 1907),
      RankEntry(9, '지호', 1830),
      RankEntry(10, '준우', 1660),
      RankEntry(11, '선우', 1581),
      RankEntry(12, '시윤', 1557),
      RankEntry(13, '은우', 1463),
      RankEntry(14, '지후', 1455),
      RankEntry(15, '도현', 1420),
      RankEntry(16, '우진', 1413),
      RankEntry(17, '서진', 1399),
      RankEntry(18, '연우', 1281),
      RankEntry(19, '건우', 1270),
      RankEntry(20, '윤우', 1257),
    ],
    girl: [
      RankEntry(1, '하윤', 2424),
      RankEntry(2, '서윤', 2318),
      RankEntry(3, '서연', 2049),
      RankEntry(4, '하은', 1999),
      RankEntry(5, '지유', 1968),
      RankEntry(6, '지우', 1877),
      RankEntry(7, '하린', 1873),
      RankEntry(8, '수아', 1764),
      RankEntry(9, '지아', 1707),
      RankEntry(10, '서아', 1682),
      RankEntry(11, '지안', 1513),
      RankEntry(12, '다은', 1487),
      RankEntry(13, '서현', 1433),
      RankEntry(14, '시아', 1401),
      RankEntry(15, '채원', 1397),
      RankEntry(16, '예린', 1344),
      RankEntry(17, '소율', 1308),
      RankEntry(18, '민서', 1276),
      RankEntry(19, '윤서', 1270),
      RankEntry(20, '소윤', 1236),
    ],
  ),
  2018: YearRanking(
    boy: [
      RankEntry(1, '서준', 2908),
      RankEntry(2, '하준', 2555),
      RankEntry(3, '도윤', 2200),
      RankEntry(4, '시우', 2180),
      RankEntry(5, '민준', 1998),
      RankEntry(6, '지호', 1971),
      RankEntry(7, '예준', 1845),
      RankEntry(8, '주원', 1714),
      RankEntry(9, '은우', 1667),
      RankEntry(10, '유준', 1542),
      RankEntry(11, '서진', 1507),
      RankEntry(12, '준우', 1420),
      RankEntry(13, '우진', 1395),
      RankEntry(14, '시윤', 1378),
      RankEntry(15, '수호', 1335),
      RankEntry(16, '선우', 1332),
      RankEntry(17, '지후', 1325),
      RankEntry(18, '건우', 1269),
      RankEntry(19, '윤우', 1210),
      RankEntry(20, '연우', 1201),
    ],
    girl: [
      RankEntry(1, '지안', 2627),
      RankEntry(2, '하윤', 2073),
      RankEntry(3, '서아', 2068),
      RankEntry(4, '서윤', 2019),
      RankEntry(5, '하린', 1880),
      RankEntry(6, '하은', 1871),
      RankEntry(7, '서연', 1757),
      RankEntry(8, '지우', 1736),
      RankEntry(9, '수아', 1734),
      RankEntry(10, '지유', 1707),
      RankEntry(11, '지아', 1588),
      RankEntry(12, '시아', 1442),
      RankEntry(13, '서현', 1331),
      RankEntry(14, '다은', 1310),
      RankEntry(15, '민서', 1276),
      RankEntry(16, '소율', 1274),
      RankEntry(17, '유주', 1234),
      RankEntry(18, '예린', 1178),
      RankEntry(19, '채원', 1149),
      RankEntry(20, '아린', 1134),
    ],
  ),
  2019: YearRanking(
    boy: [
      RankEntry(1, '서준', 2555),
      RankEntry(2, '하준', 2261),
      RankEntry(3, '도윤', 2164),
      RankEntry(4, '시우', 2100),
      RankEntry(5, '은우', 2032),
      RankEntry(6, '지호', 1727),
      RankEntry(7, '예준', 1700),
      RankEntry(8, '민준', 1622),
      RankEntry(9, '유준', 1615),
      RankEntry(10, '주원', 1531),
      RankEntry(11, '이준', 1439),
      RankEntry(12, '우진', 1388),
      RankEntry(13, '건우', 1376),
      RankEntry(14, '준우', 1338),
      RankEntry(15, '시윤', 1332),
      RankEntry(16, '수호', 1323),
      RankEntry(17, '선우', 1256),
      RankEntry(18, '지후', 1237),
      RankEntry(19, '서진', 1226),
      RankEntry(20, '연우', 1136),
    ],
    girl: [
      RankEntry(1, '지안', 2162),
      RankEntry(2, '하윤', 1942),
      RankEntry(3, '서아', 1939),
      RankEntry(4, '하은', 1865),
      RankEntry(5, '서윤', 1841),
      RankEntry(6, '하린', 1663),
      RankEntry(7, '지우', 1597),
      RankEntry(8, '지유', 1519),
      RankEntry(9, '수아', 1501),
      RankEntry(10, '지아', 1444),
      RankEntry(11, '시아', 1397),
      RankEntry(12, '서연', 1376),
      RankEntry(13, '나은', 1312),
      RankEntry(14, '아린', 1280),
      RankEntry(15, '다은', 1254),
      RankEntry(16, '유주', 1154),
      RankEntry(17, '소율', 1114),
      RankEntry(18, '채원', 1114),
      RankEntry(19, '서현', 1085),
      RankEntry(20, '윤서', 1076),
    ],
  ),
  2020: YearRanking(
    boy: [
      RankEntry(1, '도윤', 2393),
      RankEntry(2, '서준', 2393),
      RankEntry(3, '하준', 1991),
      RankEntry(4, '은우', 1921),
      RankEntry(5, '시우', 1901),
      RankEntry(6, '이준', 1761),
      RankEntry(7, '지호', 1643),
      RankEntry(8, '예준', 1462),
      RankEntry(9, '유준', 1380),
      RankEntry(10, '주원', 1261),
      RankEntry(11, '건우', 1257),
      RankEntry(12, '도현', 1256),
      RankEntry(13, '수호', 1252),
      RankEntry(14, '민준', 1245),
      RankEntry(15, '연우', 1241),
      RankEntry(16, '선우', 1167),
      RankEntry(17, '이안', 1167),
      RankEntry(18, '우진', 1133),
      RankEntry(19, '준우', 1130),
      RankEntry(20, '서진', 1092),
    ],
    girl: [
      RankEntry(1, '서아', 2099),
      RankEntry(2, '하윤', 1911),
      RankEntry(3, '지안', 1808),
      RankEntry(4, '서윤', 1581),
      RankEntry(5, '하은', 1542),
      RankEntry(6, '아린', 1494),
      RankEntry(7, '하린', 1479),
      RankEntry(8, '아윤', 1449),
      RankEntry(9, '지우', 1378),
      RankEntry(10, '수아', 1356),
      RankEntry(11, '시아', 1327),
      RankEntry(12, '나은', 1321),
      RankEntry(13, '지유', 1318),
      RankEntry(14, '지아', 1317),
      RankEntry(15, '서연', 1152),
      RankEntry(16, '유나', 1091),
      RankEntry(17, '예나', 1073),
      RankEntry(18, '서우', 1063),
      RankEntry(19, '다은', 1042),
      RankEntry(20, '유주', 984),
    ],
  ),
  2021: YearRanking(
    boy: [
      RankEntry(1, '이준', 2753),
      RankEntry(2, '서준', 2373),
      RankEntry(3, '하준', 2180),
      RankEntry(4, '도윤', 2143),
      RankEntry(5, '은우', 1870),
      RankEntry(6, '시우', 1796),
      RankEntry(7, '지호', 1564),
      RankEntry(8, '예준', 1440),
      RankEntry(9, '수호', 1351),
      RankEntry(10, '유준', 1326),
      RankEntry(11, '선우', 1307),
      RankEntry(12, '이안', 1295),
      RankEntry(13, '로운', 1261),
      RankEntry(14, '민준', 1205),
      RankEntry(15, '주원', 1201),
      RankEntry(16, '건우', 1119),
      RankEntry(17, '준우', 1106),
      RankEntry(18, '연우', 1073),
      RankEntry(19, '도현', 1067),
      RankEntry(20, '우주', 1031),
    ],
    girl: [
      RankEntry(1, '서아', 2277),
      RankEntry(2, '하윤', 2015),
      RankEntry(3, '이서', 1968),
      RankEntry(4, '지아', 1647),
      RankEntry(5, '지안', 1628),
      RankEntry(6, '서윤', 1486),
      RankEntry(7, '아린', 1466),
      RankEntry(8, '아윤', 1435),
      RankEntry(9, '하린', 1433),
      RankEntry(10, '하은', 1345),
      RankEntry(11, '지우', 1292),
      RankEntry(12, '시아', 1262),
      RankEntry(13, '지유', 1167),
      RankEntry(14, '수아', 1115),
      RankEntry(15, '나은', 1108),
      RankEntry(16, '서하', 1066),
      RankEntry(17, '서연', 1048),
      RankEntry(18, '유나', 1042),
      RankEntry(19, '서우', 1004),
      RankEntry(20, '하율', 976),
    ],
  ),
  2022: YearRanking(
    boy: [
      RankEntry(1, '이준', 2652),
      RankEntry(2, '서준', 2014),
      RankEntry(3, '시우', 1988),
      RankEntry(4, '하준', 1980),
      RankEntry(5, '도윤', 1793),
      RankEntry(6, '은우', 1763),
      RankEntry(7, '지호', 1713),
      RankEntry(8, '이안', 1602),
      RankEntry(9, '선우', 1437),
      RankEntry(10, '유준', 1325),
      RankEntry(11, '수호', 1321),
      RankEntry(12, '예준', 1317),
      RankEntry(13, '로운', 1186),
      RankEntry(14, '우주', 1158),
      RankEntry(15, '이현', 1137),
      RankEntry(16, '도현', 1118),
      RankEntry(17, '주원', 1113),
      RankEntry(18, '연우', 1093),
      RankEntry(19, '시윤', 1065),
      RankEntry(20, '민준', 1023),
    ],
    girl: [
      RankEntry(1, '이서', 2303),
      RankEntry(2, '서아', 2279),
      RankEntry(3, '하윤', 1729),
      RankEntry(4, '지아', 1726),
      RankEntry(5, '지안', 1634),
      RankEntry(6, '아윤', 1562),
      RankEntry(7, '시아', 1487),
      RankEntry(8, '서윤', 1429),
      RankEntry(9, '아린', 1393),
      RankEntry(10, '지우', 1334),
      RankEntry(11, '하린', 1320),
      RankEntry(12, '지유', 1291),
      RankEntry(13, '유나', 1123),
      RankEntry(14, '하은', 1096),
      RankEntry(15, '채아', 1047),
      RankEntry(16, '예나', 968),
      RankEntry(17, '나은', 966),
      RankEntry(18, '수아', 961),
      RankEntry(19, '리아', 957),
      RankEntry(20, '서연', 931),
    ],
  ),
  2023: YearRanking(
    boy: [
      RankEntry(1, '이준', 2076),
      RankEntry(2, '도윤', 1890),
      RankEntry(3, '하준', 1850),
      RankEntry(4, '은우', 1725),
      RankEntry(5, '서준', 1685),
      RankEntry(6, '시우', 1550),
      RankEntry(7, '지호', 1429),
      RankEntry(8, '유준', 1385),
      RankEntry(9, '도현', 1367),
      RankEntry(10, '선우', 1325),
      RankEntry(11, '이안', 1315),
      RankEntry(12, '예준', 1258),
      RankEntry(13, '우주', 1184),
      RankEntry(14, '수호', 1156),
      RankEntry(15, '로운', 1143),
      RankEntry(16, '도하', 1103),
      RankEntry(17, '연우', 1094),
      RankEntry(18, '이현', 1093),
      RankEntry(19, '태오', 1028),
      RankEntry(20, '윤우', 1012),
    ],
    girl: [
      RankEntry(1, '서아', 2060),
      RankEntry(2, '이서', 1827),
      RankEntry(3, '지아', 1484),
      RankEntry(4, '아윤', 1480),
      RankEntry(5, '하윤', 1418),
      RankEntry(6, '지유', 1288),
      RankEntry(7, '서윤', 1275),
      RankEntry(8, '아린', 1260),
      RankEntry(9, '시아', 1242),
      RankEntry(10, '지안', 1184),
      RankEntry(11, '하린', 1181),
      RankEntry(12, '지우', 1134),
      RankEntry(13, '유나', 1106),
      RankEntry(14, '채아', 1022),
      RankEntry(15, '리아', 1010),
      RankEntry(16, '수아', 988),
      RankEntry(17, '예나', 966),
      RankEntry(18, '유주', 877),
      RankEntry(19, '나은', 876),
      RankEntry(20, '하은', 867),
    ],
  ),
  2024: YearRanking(
    boy: [
      RankEntry(1, '이준', 1872),
      RankEntry(2, '하준', 1780),
      RankEntry(3, '도윤', 1759),
      RankEntry(4, '은우', 1614),
      RankEntry(5, '시우', 1597),
      RankEntry(6, '서준', 1541),
      RankEntry(7, '선우', 1485),
      RankEntry(8, '유준', 1412),
      RankEntry(9, '이안', 1400),
      RankEntry(10, '태오', 1392),
      RankEntry(11, '수호', 1383),
      RankEntry(12, '도현', 1379),
      RankEntry(13, '이현', 1327),
      RankEntry(14, '지호', 1320),
      RankEntry(15, '도하', 1283),
      RankEntry(16, '우주', 1257),
      RankEntry(17, '예준', 1153),
      RankEntry(18, '주원', 1061),
      RankEntry(19, '로운', 1051),
      RankEntry(20, '지한', 1050),
    ],
    girl: [
      RankEntry(1, '서아', 1927),
      RankEntry(2, '이서', 1925),
      RankEntry(3, '하린', 1493),
      RankEntry(4, '지유', 1423),
      RankEntry(5, '지안', 1398),
      RankEntry(6, '하윤', 1398),
      RankEntry(7, '아윤', 1397),
      RankEntry(8, '지아', 1365),
      RankEntry(9, '아린', 1281),
      RankEntry(10, '시아', 1278),
      RankEntry(11, '서윤', 1255),
      RankEntry(12, '지우', 1120),
      RankEntry(13, '유나', 1037),
      RankEntry(14, '유주', 1027),
      RankEntry(15, '채아', 1003),
      RankEntry(16, '수아', 974),
      RankEntry(17, '윤서', 971),
      RankEntry(18, '윤슬', 967),
      RankEntry(19, '서하', 943),
      RankEntry(20, '리아', 917),
    ],
  ),
  2025: YearRanking(
    boy: [
      RankEntry(1, '도윤', 2336),
      RankEntry(2, '이준', 1958),
      RankEntry(3, '하준', 1911),
      RankEntry(4, '시우', 1797),
      RankEntry(5, '도현', 1706),
      RankEntry(6, '이안', 1653),
      RankEntry(7, '태오', 1637),
      RankEntry(8, '서준', 1598),
      RankEntry(9, '선우', 1541),
      RankEntry(10, '은우', 1495),
      RankEntry(11, '수호', 1458),
      RankEntry(12, '이현', 1444),
      RankEntry(13, '도하', 1442),
      RankEntry(14, '지호', 1387),
      RankEntry(15, '우주', 1385),
      RankEntry(16, '유준', 1284),
      RankEntry(17, '은호', 1278),
      RankEntry(18, '윤우', 1275),
      RankEntry(19, '주원', 1154),
      RankEntry(20, '시윤', 1153),
    ],
    girl: [
      RankEntry(1, '서아', 2016),
      RankEntry(2, '서윤', 1877),
      RankEntry(3, '하린', 1830),
      RankEntry(4, '이서', 1785),
      RankEntry(5, '하윤', 1721),
      RankEntry(6, '아린', 1611),
      RankEntry(7, '지안', 1594),
      RankEntry(8, '지유', 1456),
      RankEntry(9, '아윤', 1452),
      RankEntry(10, '시아', 1435),
      RankEntry(11, '윤서', 1249),
      RankEntry(12, '지아', 1237),
      RankEntry(13, '지우', 1208),
      RankEntry(14, '유나', 1189),
      RankEntry(15, '채이', 1161),
      RankEntry(16, '수아', 1102),
      RankEntry(17, '채아', 1070),
      RankEntry(18, '도아', 1046),
      RankEntry(19, '예린', 1031),
      RankEntry(20, '유하', 1023),
    ],
  ),
};

/// 선택 가능한 연도 (최신순)
final List<int> rankingYears = rankingsByYear.keys.toList()
  ..sort((a, b) => b.compareTo(a));

/// 가장 최근 연도 (점수 계산의 '흔한 이름' 판정 기준)
final int latestRankingYear = rankingYears.first;

String rankingSourceFor(int year) => '법원 전자가족관계등록시스템 출생신고 이름 통계 ($year년 연간)';

// 이름 → 최신 연도 랭킹 순위 조회 (남/여 각각, 없으면 null)
int? boyRankOf(String name) {
  for (final r in rankingsByYear[latestRankingYear]!.boy) {
    if (r.name == name) return r.rank;
  }
  return null;
}

int? girlRankOf(String name) {
  for (final r in rankingsByYear[latestRankingYear]!.girl) {
    if (r.name == name) return r.rank;
  }
  return null;
}

bool _hasBatchim(String s) {
  if (s.isEmpty) return false;
  final code = s.codeUnitAt(s.length - 1);
  if (code < 0xAC00 || code > 0xD7A3) return false;
  return (code - 0xAC00) % 28 != 0;
}

String _iga(String name) => _hasBatchim(name) ? '이' : '가';

/// 연도·성별 트렌드 요약 (데이터에서 자동 생성)
/// - 올해 1위, 전년 대비 신규 진입, 가장 많이 오른 이름을 뽑아요.
List<String> trendLines(int year, {required bool boy}) {
  final cur = boy ? rankingsByYear[year]!.boy : rankingsByYear[year]!.girl;
  final lines = <String>[];
  final top = cur.first;
  lines.add('${top.name}${_iga(top.name)} ${top.count}명으로 1위예요.');

  final prevYear = rankingsByYear[year - 1];
  if (prevYear == null) {
    lines.add('최근 10년 데이터 중 가장 이른 해예요.');
    return lines;
  }
  final prev = boy ? prevYear.boy : prevYear.girl;
  final prevRank = {for (final e in prev) e.name: e.rank};

  // 전년 TOP 20에 없던 신규 진입
  final newcomers = cur.where((e) => !prevRank.containsKey(e.name)).toList();
  if (newcomers.isNotEmpty) {
    final shown = newcomers.take(3).toList();
    final names = shown.map((e) => e.name).join('·');
    final hasMore = newcomers.length > 3;
    final suffix = hasMore ? ' 등' : '';
    // 조사는 마지막으로 말하는 이름(또는 '등')의 받침을 따라요.
    final particle = hasMore ? '이' : _iga(shown.last.name);
    lines.add('전년 TOP 20 밖이던 $names$suffix$particle 새로 진입했어요.');
  }

  // 가장 많이 오른 이름
  String? riser;
  var bestGain = 0;
  var riserFrom = 0;
  var riserTo = 0;
  for (final e in cur) {
    final before = prevRank[e.name];
    if (before == null) continue;
    final gain = before - e.rank;
    if (gain > bestGain) {
      bestGain = gain;
      riser = e.name;
      riserFrom = before;
      riserTo = e.rank;
    }
  }
  if (riser != null) {
    lines.add('$riser${_iga(riser)} 전년 $riserFrom위에서 $riserTo위로 올랐어요.');
  }
  return lines;
}
