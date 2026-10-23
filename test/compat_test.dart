import 'package:flutter_test/flutter_test.dart';
import 'package:jakmyeongbyeol/engine/compat.dart';
import 'package:jakmyeongbyeol/models.dart';

void main() {
  group('띠 관계', () {
    test('삼합: 인-오, 신-자', () {
      expect(zodiacRelation('인', '오'), ZodiacRelation.samhap);
      expect(zodiacRelation('신', '자'), ZodiacRelation.samhap);
      expect(zodiacScore('인', '오'), 20);
    });
    test('육합: 자-축, 오-미', () {
      expect(zodiacRelation('자', '축'), ZodiacRelation.yukhap);
      expect(zodiacRelation('미', '오'), ZodiacRelation.yukhap);
      expect(zodiacScore('자', '축'), 17);
    });
    test('충: 자-오, 묘-유', () {
      expect(zodiacRelation('자', '오'), ZodiacRelation.chung);
      expect(zodiacRelation('유', '묘'), ZodiacRelation.chung);
      expect(zodiacScore('자', '오'), 4);
    });
    test('동일 띠와 무난한 관계', () {
      expect(zodiacRelation('진', '진'), ZodiacRelation.same);
      expect(zodiacRelation('자', '인'), ZodiacRelation.normal);
    });
  });

  group('가족 궁합 통합', () {
    final picks = [
      const HanjaPick(
          syllable: '도', char: '道', strokes: 13, element: '화', meaning: '길'),
      const HanjaPick(
          syllable: '윤', char: '潤', strokes: 16, element: '수', meaning: '윤택'),
    ];

    FamilyCompatResult sample({bool withSibling = false}) {
      return computeFamilyCompat(
        members: [
          (label: '아빠', saju: sajuOfBirth(DateTime(1987, 6, 15), 10)),
          (label: '엄마', saju: sajuOfBirth(DateTime(1990, 9, 20), null)),
          if (withSibling)
            (label: '형', saju: sajuOfBirth(DateTime(2021, 3, 5), null)),
        ],
        babySaju: sajuOfBirth(DateTime(2026, 10, 19), 8),
        picks: picks,
      );
    }

    test('점수가 0~100 범위를 지키고 결정적이다', () {
      final r1 = sample();
      final r2 = sample();
      expect(r1.members.length, 2);
      expect(r1.total, inInclusiveRange(0, 100));
      for (final m in r1.members) {
        expect(m.total, inInclusiveRange(0, 100));
        expect(m.details, isNotEmpty);
      }
      expect(r1.total, r2.total);
      // 이름 오행 2개가 가족 분포에 반영돼야 한다
      final beforeSum =
          r1.familyCountsBefore.values.reduce((a, b) => a + b);
      final afterSum = r1.familyCountsAfter.values.reduce((a, b) => a + b);
      expect(afterSum - beforeSum, 2);
    });

    test('부분 점수가 만점을 넘지 않는다', () {
      final r = computeFamilyCompat(
        members: [
          (label: '할아버지', saju: sajuOfBirth(DateTime(1955, 3, 3), null)),
          (label: '할머니', saju: sajuOfBirth(DateTime(1960, 12, 25), 23)),
        ],
        babySaju: sajuOfBirth(DateTime(2024, 3, 10), null),
        picks: picks,
      );
      for (final m in r.members) {
        expect(m.elementScore, inInclusiveRange(0, 40));
        expect(m.yongsinScore, inInclusiveRange(0, 40));
        expect(m.zodiacScoreValue, inInclusiveRange(0, 20));
      }
    });

    test('구성원을 추가하면 평균과 순위가 맞게 계산된다', () {
      final r = sample(withSibling: true);
      expect(r.members.length, 3);
      final mean =
          r.members.map((m) => m.total).reduce((a, b) => a + b) / 3;
      expect(r.total, closeTo(mean, 0.001));
      expect(r.best.total, r.ranked.first.total);
      // 순위는 내림차순
      for (var i = 0; i + 1 < r.ranked.length; i++) {
        expect(r.ranked[i].total >= r.ranked[i + 1].total, isTrue);
      }
    });
  });
}
