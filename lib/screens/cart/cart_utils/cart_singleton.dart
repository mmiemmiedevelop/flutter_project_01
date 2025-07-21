class Cart {
  // 1. 내부에 static 인스턴스 선언
  static final Cart _instance = Cart._internal();

  // 2. 외부에서 new로 생성하지 못하게 factory 생성자 사용
  factory Cart() {
    return _instance;
  }

  // 3. 내부에서만 호출 가능한 실제 생성자
  Cart._internal();

  // 🛒 장바구니에 담긴 수량
  int quantity = 0;

  // 수량 추가 메소드
  void add(int count) {
    quantity += count;
  }

  // 수량 감소 메소드
  void subtract(int count) {
    quantity -= count;
  }

  // 수량 리셋
  void clear() {
    quantity = 0;
  }
}
