import 'package:flutter_test/flutter_test.dart';
import 'package:jakmyeongbyeol/data/rankings.dart';

void main() {
  test('연도별 랭킹 데이터 완결성 (2016~2025)', () {
    expect(rankingYears.first, 2025);
    expect(rankingYears.last, 2016);
    expect(rankingYears.length, 10);
    for (final y in rankingYears) {
      final yr = rankingsByYear[y]!;
      for (final list in [yr.boy, yr.girl]) {
        expect(list.length, 20, reason: '$y');
        expect(list.map((e) => e.rank).toList(),
            List.generate(20, (i) => i + 1),
            reason: '$y 순위 연속성');
        expect(list.every((e) => e.count > 0 && e.name.isNotEmpty),
            isTrue,
            reason: '$y 건수/이름');
      }
    }
  });

  test('트렌드 문구와 최신 연도 순위 조회', () {
    expect(trendLines(2025, boy: true).first, contains('도윤'));
    expect(trendLines(2025, boy: false).first, contains('서아'));
    expect(trendLines(2016, boy: true).length, 2); // 1위 + 가장 이른 해 안내
    expect(trendLines(2025, boy: true).length, greaterThanOrEqualTo(2));
    expect(latestRankingYear, 2025);
    expect(boyRankOf('도윤'), 1);
    expect(girlRankOf('서아'), 1);
    expect(boyRankOf('없는이름'), isNull);
  });
}
