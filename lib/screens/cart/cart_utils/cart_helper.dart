import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/common/models/model_item.dart';
import 'cart_singleton.dart';

class CartHelper {
  // 총 가격 계산 헬퍼 함수
  static int calculateTotalPrice() {
    return Cart().items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  // 장바구니 아이템 추가 헬퍼 함수
  static void addItemToCart(Item item, int qty) {
    Cart().addItem(item, quantity: qty);
  }

  // 장바구니 아이템 제거 헬퍼 함수
  static void removeItemFromCart(Item item, {int quantity = 1}) {
    Cart().removeItem(item, quantity: quantity);
  }

  // 장바구니 아이템 수량 변경 헬퍼 함수
  static void updateItemQuantity(Item item, int newQty) {
    final cart = Cart();
    final index = cart.items.indexWhere(
      (cartItem) => cartItem.item.id == item.id,
    );
    if (index != -1) {
      if (newQty <= 0) {
        cart.removeItem(item, quantity: cart.items[index].qty);
      } else {
        cart.items[index].qty = newQty;
        cart.items[index].totalPrice = cart.items[index].item.price * newQty;
      }
    }
  }
}
