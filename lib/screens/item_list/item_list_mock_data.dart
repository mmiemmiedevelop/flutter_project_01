import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/common/models/model_item.dart';

class ItemListMockData {
  static final List<CartItem> _cartItems = [
    CartItem(
      item: Item(
        id: '0',
        image: 'assets/images/p1.png',
        name: '오징어게임 초대장',
        price: 0,
        desc:
            '오징어게임 초대장은 빨간 동그라미, 세모, 네모 문양이 새겨진 독특한 디자인의 카드입니다. 이 초대장을 받으면, 오직 초대받은 사람만이 입장 가능한 비밀스러운 쇼핑 미션에 참여할 수 있습니다.',
      ),
      qty: 1,
      totalPrice: 0,
    ),
    CartItem(
      item: Item(
        id: '1',
        image: 'assets/images/p2.png',
        name: '럭키비키 001 츄리닝',
        price: 25000,
        desc:
            '"당신도 001번 플레이어처럼 운명을 바꿔보세요"\n\n🏆 1등의 운을 담은 특별한 츄리닝\n\n· 운명을 바꾼 전설의 001번을 재현한 한정판\n\n⚠️ 특별 주의사항\n\n본 제품 착용 시 운이 급상승할 수 있습니다 001번의 운명은 본인 몫입니다 실제 456억원은 포함되지 않습니다 게임 참가권은 별매입니다',
      ),
      qty: 1,
      totalPrice: 25000,
    ),
    CartItem(
      item: Item(
        id: '2',
        image: 'assets/images/p3.png',
        name: '목숨 건 달고나 챌린지',
        price: 18000,
        desc:
            '목숨 건 달고나 챌린지는 제한된 시간 동안 달고나 과자의 지정된 모양을 부수지 않고 깔끔하게 분리해야 하는 미션입니다. 성공하면 특별한 혜택이 주어지지만, 실패하면 즉시 탈락하는 극한의 긴장감을 느낄 수 있습니다.',
      ),
      qty: 1,
      totalPrice: 18000,
    ),
    CartItem(
      item: Item(
        id: '3',
        image: 'assets/images/p4.png',
        name: '□△○ 트리플 세트',
        price: 32000,
        desc:
            '□△○ 트리플 세트는 오징어게임을 대표하는 네모, 세모, 동그라미 문양을 활용한 한정판 아이템 패키지입니다. 각각의 상징적인 도형이 담긴 굿즈로 구성되어 있어, 오징어게임의 세계관을 색다르게 경험할 수 있습니다. 소장용 또는 선물용으로 추천드립니다.',
      ),
      qty: 1,
      totalPrice: 32000,
    ),
    CartItem(
      item: Item(
        id: '4',
        image: 'assets/images/p5.png',
        name: '오겜 소주 에디션',
        price: 12000,
        desc:
            '오징어게임 소주 에디션은 오징어게임의 상징적인 도형(□△○)과 독특한 디자인을 적용한 한정판 소주 세트입니다. 소장 가치는 물론, 파티나 모임에서 오징어게임의 분위기를 그대로 느낄 수 있습니다. 특별한 선물이나 이벤트용으로도 잘 어울립니다.',
      ),
      qty: 1,
      totalPrice: 12000,
    ),
  ];

  static List<CartItem> getCartItems() {
    return List.from(_cartItems);
  }

  // 상품추가시 동작
  static void addNewItem(Map<String, dynamic> itemData) {
    try {
      final newItem = Item(
        id: (_cartItems.length).toString(), // 마지막아이디 다음 아이디 생성
        image: itemData['image'] ?? 'assets/images/p1.png',
        name: itemData['name'] ?? '새로운 상품',
        price: int.tryParse(itemData['price'].toString()) ?? 0,
        desc: itemData['description'] ?? '새로운 상품입니다.',
      );

      // CartItem 객체 생성
      final newCartItem = CartItem(
        item: newItem,
        qty: 1,
        totalPrice: newItem.price,
      );

      // 리스트에 추가
      _cartItems.add(newCartItem);
    } catch (e) {
      //print('아이템 추가 중 오류:$e');
    }
  }
}
