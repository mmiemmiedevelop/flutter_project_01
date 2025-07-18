import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/common/models/model_item.dart';

class CartMockData {
  // [todo-sam] 장바구니 목 데이터 > 데이터 연결 필요
  static List<CartItem> getCartItems() {
    return [
      CartItem(
        item: Item(
          id: '1',
          image: 'assets/images/logo.png', //[todo-sam] 실제 이미지로 교체 필요
          name: '럭키비키 001 츄리닝',
          price: 25000,
          desc: 'Squid Game 캐릭터 의상',
        ),
        qty: 3,
        totalPrice: 75000, //[todo-sam] 3개 * 25,000원
      ),
      CartItem(
        item: Item(
          id: '2',
          image: 'assets/images/logo.png', //[todo-sam] 실제 이미지로 교체 필요
          name: '몰래 연습하는 전통 놀이',
          price: 20000,
          desc: '달고나 게임 세트',
        ),
        qty: 1,
        totalPrice: 20000, //[todo-sam] 1개 * 20,000원
      ),
    ];
  }

  // 빈 장바구니 반환
  static List<CartItem> getEmptyCart() {
    return [];
  }
}
