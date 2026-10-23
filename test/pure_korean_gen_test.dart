import 'package:flutter_test/flutter_test.dart';
import 'package:jakmyeongbyeol/engine/generator.dart';
import 'package:jakmyeongbyeol/engine/saju.dart';
import 'package:jakmyeongbyeol/models.dart';

void main() {
  test('순우리말 이름 생성: 성별 필터와 점수 정렬', () {
    final baby = BabyInfo(
      surname: '김',
      surnameHanja: '金',
      surnameStrokes: 8,
      gender: Gender.boy,
      birth: DateTime(2026, 10, 19),
      birthHour: 10,
      birthMinute: 30,
    );
    final saju = computeSaju(baby);
    final names = generatePureKoreanNames(baby, saju);
    expect(names, isNotEmpty);
    expect(names.length, inInclusiveRange(25, 35)); // 남아+공통 풀
    expect(names.every((a) => a.isPureKorean), isTrue);
    // 여아 전용 이름이 남아 목록에 없어야 함
    expect(names.map((a) => a.givenName), isNot(contains('다솜')));
    expect(names.map((a) => a.givenName), contains('한결'));
    // 내림차순 정렬
    for (var i = 1; i < names.length; i++) {
      expect(names[i - 1].total, greaterThanOrEqualTo(names[i].total));
    }
    // 여아 풀 확인
    final girl = BabyInfo(
      surname: '김',
      surnameHanja: '金',
      surnameStrokes: 8,
      gender: Gender.girl,
      birth: DateTime(2026, 10, 19),
    );
    final girlNames = generatePureKoreanNames(girl, computeSaju(girl));
    expect(girlNames.map((a) => a.givenName), contains('다솜'));
    expect(girlNames.map((a) => a.givenName), isNot(contains('한결')));
  });
}
