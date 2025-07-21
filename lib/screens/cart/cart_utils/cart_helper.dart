import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/common/models/model_item.dart';

class CartHelper {
  // 총 가격 계산 헬퍼 함수
  static int calculateTotalPrice(List<CartItem> cartItems) {
    return cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  // 수량 업데이트 헬퍼 함수
  static CartItem updateCartItemQuantity(CartItem cartItem, int newQty) {
    return CartItem(
      item: cartItem.item,
      qty: newQty,
      totalPrice: cartItem.item.price * newQty,
    );
  }

  // 장바구니 아이템 추가 헬퍼 함수
  static List<CartItem> addItemToCart(
    List<CartItem> cartItems,
    Item item,
    int qty,
  ) {
    // 이미 존재하는 아이템인지 확인
    final existingIndex = cartItems.indexWhere(
      (cartItem) => cartItem.item.id == item.id,
    );

    if (existingIndex != -1) {
      // 기존 아이템 수량 증가
      final existingItem = cartItems[existingIndex];
      cartItems[existingIndex] = updateCartItemQuantity(
        existingItem,
        existingItem.qty + qty,
      );
    } else {
      // 새 아이템 추가
      cartItems.add(
        CartItem(item: item, qty: qty, totalPrice: item.price * qty),
      );
    }

    return cartItems;
  }

  // 장바구니 아이템 제거 헬퍼 함수
  static List<CartItem> removeItemFromCart(
    List<CartItem> cartItems,
    String itemId,
  ) {
    cartItems.removeWhere((cartItem) => cartItem.item.id == itemId);
    return cartItems;
  }

  // 장바구니 아이템 수량 변경 헬퍼 함수
  static List<CartItem> updateItemQuantity(
    List<CartItem> cartItems,
    String itemId,
    int newQty,
  ) {
    final index = cartItems.indexWhere(
      (cartItem) => cartItem.item.id == itemId,
    );

    if (index != -1) {
      if (newQty <= 0) {
        // 수량이 0 이하면 아이템 제거
        cartItems.removeAt(index);
      } else {
        // 수량 업데이트
        cartItems[index] = updateCartItemQuantity(cartItems[index], newQty);
      }
    }

    return cartItems;
  }
}
