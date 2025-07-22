import 'package:flutter_project_01/common/models/model_item.dart';

class CartItem {
  Item item; // 상품 정보
  int qty; // 수량
  int totalPrice; // 총 가격

  CartItem({required this.item, required this.qty, required this.totalPrice});
}

// 사용 예시
// 1. Item 객체 생성
// final sampleItem = Item(
//   id: 'p001',
//   image: 'https://example.com/image.png',
//   name: '샘플 상품',
//   price: 9900,
// );

// // 2.CartItem 객체 생성 (qty: 2, 총 가격: 19,800원)
// final cartItem = CartItem(
//   item: sampleItem,
//   qty: 2,
//   totalPrice: sampleItem.price * 2,
// );