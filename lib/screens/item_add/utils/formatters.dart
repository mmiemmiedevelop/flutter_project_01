class Formatters {
  // 가격에 천 단위 콤마 추가
  static String formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), 
      (Match m) => '${m[1]},'
    );
  }

  // 가격 문자열을 숫자로 안전하게 변환
  static int parsePrice(String priceString) {
    try {
      return int.parse(priceString.replaceAll(',', '').replaceAll('원', '').trim());
    } catch (e) {
      return 0;
    }
  }
}