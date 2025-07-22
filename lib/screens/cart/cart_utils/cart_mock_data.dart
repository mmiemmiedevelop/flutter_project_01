import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/common/models/model_item.dart';
import 'package:flutter_project_01/screens/cart/cart_utils/cart_singleton.dart';

class CartMockData {
  // 장바구니 목 데이터 > Cart() singleton [갯수만]데이터 연결만 해놓음
  static List<CartItem> getCartItems() {
    return [
      CartItem(
        item: Item(
          id: '1',
          image: 'assets/images/01.png',
          name: '럭키비키 001 츄리닝',
          price: 25000,
          desc: 'Squid Game 캐릭터 의상',
        ),
        qty:0, //Cart().quantity,
        totalPrice: 0,//Cart().quantity * 25000,
      ),
      // CartItem(
      //   item: Item(
      //     id: '2',
      //     image: 'assets/images/p3.png',
      //     name: '목숨 건 달고나 챌린지',
      //     price: 18000,
      //     desc: '달고나 게임 세트',
      //   ),
      //   qty: 1,
      //   totalPrice: 18000,
      // ),
      // CartItem(
      //   item: Item(
      //     id: '3',
      //     image: 'assets/images/p4.png',
      //     name: '◯ △ □ 트리플 세트',
      //     price: 32000,
      //     desc: '트리플 세트',
      //   ),
      //   qty: 1,
      //   totalPrice: 32000,
      // ),
      // CartItem(
      //   item: Item(
      //     id: '4',
      //     image: 'assets/images/p5.png',
      //     name: '오겜 소주 에디션',
      //     price: 12000,
      //     desc: '오겜 소주 에디션',
      //   ),
      //   qty: 1,
      //   totalPrice: 12000,
      // ),
    ];
  }

  // 빈 장바구니 반환
  static List<CartItem> getEmptyCart() {
    return [];
  }
}
