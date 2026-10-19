// 81수리 길흉표
// 등급: daegil(대길) / gil(길) / mixed(반길반흉·학파별 상이) / hyung(흉)
// 기준: 한국작명연구원·대훈철학원 분류 + gilra 4등급의 이견 수리는 반길반흉 처리

class SuriInfo {
  final String grade; // daegil, gil, mixed, hyung
  final String name; // 격칭
  const SuriInfo(this.grade, this.name);
}

const Map<int, SuriInfo> suri81 = {
  1: SuriInfo('daegil', '기본격'),
  2: SuriInfo('hyung', '분리격'),
  3: SuriInfo('daegil', '성형격'),
  4: SuriInfo('hyung', '부정격'),
  5: SuriInfo('daegil', '정성격'),
  6: SuriInfo('gil', '계성격'),
  7: SuriInfo('gil', '독립격'),
  8: SuriInfo('gil', '개물격'),
  9: SuriInfo('hyung', '궁박격'),
  10: SuriInfo('hyung', '공허격'),
  11: SuriInfo('daegil', '신성격'),
  12: SuriInfo('hyung', '박약격'),
  13: SuriInfo('daegil', '지모격'),
  14: SuriInfo('hyung', '이산격'),
  15: SuriInfo('daegil', '통솔격'),
  16: SuriInfo('daegil', '덕망격'),
  17: SuriInfo('mixed', '건창격'),
  18: SuriInfo('mixed', '발전격'),
  19: SuriInfo('hyung', '고난격'),
  20: SuriInfo('hyung', '허망격'),
  21: SuriInfo('daegil', '두령격'),
  22: SuriInfo('hyung', '중절격'),
  23: SuriInfo('daegil', '공명격'),
  24: SuriInfo('daegil', '입신격'),
  25: SuriInfo('gil', '안전격'),
  26: SuriInfo('mixed', '시비격'),
  27: SuriInfo('mixed', '중단격'),
  28: SuriInfo('hyung', '파란격'),
  29: SuriInfo('mixed', '성공격'),
  30: SuriInfo('mixed', '부몽격'),
  31: SuriInfo('daegil', '융창격'),
  32: SuriInfo('gil', '요행격'),
  33: SuriInfo('daegil', '승천격'),
  34: SuriInfo('hyung', '파멸격'),
  35: SuriInfo('gil', '평범격'),
  36: SuriInfo('hyung', '실패격'),
  37: SuriInfo('gil', '인덕격'),
  38: SuriInfo('mixed', '복록격'),
  39: SuriInfo('gil', '안락격'),
  40: SuriInfo('mixed', '무상격'),
  41: SuriInfo('daegil', '대공격'),
  42: SuriInfo('mixed', '고행격'),
  43: SuriInfo('mixed', '미혹격'),
  44: SuriInfo('hyung', '마장격'),
  45: SuriInfo('daegil', '대지격'),
  46: SuriInfo('hyung', '부지격'),
  47: SuriInfo('gil', '출세격'),
  48: SuriInfo('gil', '유덕격'),
  49: SuriInfo('mixed', '은퇴격'),
  50: SuriInfo('mixed', '불행격'),
  51: SuriInfo('mixed', '춘추격'),
  52: SuriInfo('gil', '능직격'),
  53: SuriInfo('mixed', '불화격'),
  54: SuriInfo('hyung', '신고격'),
  55: SuriInfo('mixed', '불인격'),
  56: SuriInfo('hyung', '부족격'),
  57: SuriInfo('gil', '노력격'),
  58: SuriInfo('mixed', '자력격'),
  59: SuriInfo('hyung', '불우격'),
  60: SuriInfo('hyung', '암흑격'),
  61: SuriInfo('gil', '영화격'),
  62: SuriInfo('hyung', '고독격'),
  63: SuriInfo('gil', '길상격'),
  64: SuriInfo('hyung', '침체격'),
  65: SuriInfo('gil', '완미격'),
  66: SuriInfo('hyung', '역난격'),
  67: SuriInfo('gil', '성장격'),
  68: SuriInfo('gil', '달성격'),
  69: SuriInfo('hyung', '쇠약격'),
  70: SuriInfo('hyung', '암난격'),
  71: SuriInfo('mixed', '불안격'),
  72: SuriInfo('hyung', '상반격'),
  73: SuriInfo('mixed', '형통격'),
  74: SuriInfo('hyung', '불교격'),
  75: SuriInfo('mixed', '왕성격'),
  76: SuriInfo('hyung', '이산격'),
  77: SuriInfo('mixed', '전후격'),
  78: SuriInfo('mixed', '무력격'),
  79: SuriInfo('hyung', '불신격'),
  80: SuriInfo('hyung', '음영격'),
  81: SuriInfo('daegil', '환희격'),
};

// 수리(81 초과 시 80을 뺀 나머지로 판정)
int normalizeSuri(int n) {
  var v = n;
  while (v > 81) {
    v -= 80;
  }
  return v;
}

double suriGradeScore(String grade) {
  switch (grade) {
    case 'daegil':
      return 100;
    case 'gil':
      return 80;
    case 'mixed':
      return 55;
    default:
      return 20;
  }
}

String suriGradeLabel(String grade) {
  switch (grade) {
    case 'daegil':
      return '대길';
    case 'gil':
      return '길';
    case 'mixed':
      return '반길반흉';
    default:
      return '흉';
  }
}
