import 'package:flutter_project_01/common/models/model_item.dart';
import 'package:flutter_project_01/common/models/model_cart_item.dart';

class Cart {
  // 1. 내부에 static 인스턴스 선언
  static final Cart _instance = Cart._internal();

  // 2. 외부에서 new로 생성하지 못하게 factory 생성자 사용
  factory Cart() {
    return _instance;
  }

  // 3. 내부에서만 호출 가능한 실제 생성자
  Cart._internal();

  // 장바구니에 담긴 아이템 목록
  final List<CartItem> _items = [];

  // 장바구니에 아이템 추가
  void addItem(Item item, {int quantity = 1}) {
    // 이미 담긴 아이템인지 확인
    final index = _items.indexWhere((cartItem) => cartItem.item.id == item.id);
    if (index != -1) {
      // 이미 있으면 수량만 증가
      _items[index].qty += quantity;
    } else {
      // 없으면 새로 추가
      _items.add(CartItem(item: item, qty: quantity, totalPrice: item.price * quantity));
    }
  }

  // 장바구니에서 아이템 제거
  void removeItem(Item item, {int quantity = 1}) {
    final index = _items.indexWhere((cartItem) => cartItem.item.id == item.id);
    if (index != -1) {
      if (_items[index].qty > quantity) {
        _items[index].qty = _items[index].qty - quantity;
      } else {
        _items.removeAt(index);
      }
    }
  }

  // 장바구니 비우기
  void clear() {
    _items.clear();
  }

  // 장바구니 전체 아이템 반환
  List<CartItem> get items => List.unmodifiable(_items);
}
