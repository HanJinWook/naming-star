// 순우리말 이름 후보 데이터
// 실제로 아기 이름으로 쓰이는 순우리말 이름들을 뜻·성별 성향과 함께 정리했어요.

enum PureNameGender { boy, girl, common }

class PureKoreanName {
  final String name;
  final String meaning;
  final PureNameGender gender;
  const PureKoreanName(this.name, this.meaning, this.gender);
}

const List<PureKoreanName> pureKoreanNames = [
  PureKoreanName('가람', '강을 뜻하는 순우리말', PureNameGender.common),
  PureKoreanName('가온', '세상의 중심, 따뜻함', PureNameGender.common),
  PureKoreanName('가을', '풍요로운 계절 가을', PureNameGender.common),
  PureKoreanName('겨울', '겨울처럼 맑고 단단하게', PureNameGender.common),
  PureKoreanName('나래', '날개', PureNameGender.girl),
  PureKoreanName('나봄', '봄에 태어난 아이', PureNameGender.girl),
  PureKoreanName('누리', '세상', PureNameGender.common),
  PureKoreanName('다솜', '사랑', PureNameGender.girl),
  PureKoreanName('다온', '좋은 일이 모두 오기를', PureNameGender.common),
  PureKoreanName('라온', '즐거운', PureNameGender.common),
  PureKoreanName('마루', '산의 꼭대기, 하늘', PureNameGender.boy),
  PureKoreanName('연두', '연둣빛처럼 산뜻한', PureNameGender.girl),
  PureKoreanName('바다', '넓은 바다 같은 마음', PureNameGender.common),
  PureKoreanName('바람', '바람처럼 자유롭게', PureNameGender.boy),
  PureKoreanName('보람', '값진 열매, 보람', PureNameGender.common),
  PureKoreanName('보미', '봄에 태어난 아이', PureNameGender.girl),
  PureKoreanName('보배', '보물 같은 아이', PureNameGender.girl),
  PureKoreanName('봄이', '따뜻한 봄', PureNameGender.girl),
  PureKoreanName('사랑', '사랑', PureNameGender.girl),
  PureKoreanName('산들', '산들바람처럼 시원하게', PureNameGender.common),
  PureKoreanName('새봄', '새로운 봄', PureNameGender.girl),
  PureKoreanName('새론', '늘 새로운', PureNameGender.common),
  PureKoreanName('소담', '복스럽고 풍요로운', PureNameGender.girl),
  PureKoreanName('슬기', '슬기로움, 지혜', PureNameGender.girl),
  PureKoreanName('아라', '바다를 뜻하는 옛말', PureNameGender.girl),
  PureKoreanName('여울', '물살이 시원한 여울', PureNameGender.common),
  PureKoreanName('오름', '제주의 오름(작은 산)', PureNameGender.boy),
  PureKoreanName('온유', '따뜻하고 부드러운', PureNameGender.girl),
  PureKoreanName('우솔', '우람한 소나무', PureNameGender.boy),
  PureKoreanName('으뜸', '가장 뛰어난', PureNameGender.common),
  PureKoreanName('이든', '착하고 어진', PureNameGender.boy),
  PureKoreanName('이슬', '맑은 이슬', PureNameGender.girl),
  PureKoreanName('잔디', '푸른 잔디처럼 싱그럽게', PureNameGender.common),
  PureKoreanName('진솔', '진실하고 소박한', PureNameGender.common),
  PureKoreanName('초롱', '초롱초롱 빛나는', PureNameGender.girl),
  PureKoreanName('하늘', '넓은 하늘', PureNameGender.common),
  PureKoreanName('하람', '하늘이 내린 소중한 사람', PureNameGender.common),
  PureKoreanName('한결', '한결같은 마음', PureNameGender.boy),
  PureKoreanName('한별', '크고 밝은 별', PureNameGender.common),
  PureKoreanName('한솔', '큰 소나무', PureNameGender.boy),
  PureKoreanName('한울', '큰 울타리, 우주', PureNameGender.boy),
  PureKoreanName('해솔', '해와 소나무', PureNameGender.common),
  PureKoreanName('구름', '하늘의 구름', PureNameGender.common),
  PureKoreanName('노을', '아름다운 노을', PureNameGender.girl),
  PureKoreanName('늘봄', '언제나 봄처럼', PureNameGender.girl),
  PureKoreanName('도담', '야무지고 탐스러운', PureNameGender.common),
  PureKoreanName('루다', '꿈을 이루다', PureNameGender.girl),
  PureKoreanName('별하', '별처럼 빛나는 아이', PureNameGender.girl),
];

/// 이름으로 뜻 찾기 (추천 카드 표시용)
String? pureKoreanMeaning(String givenName) {
  for (final n in pureKoreanNames) {
    if (n.name == givenName) return n.meaning;
  }
  return null;
}
