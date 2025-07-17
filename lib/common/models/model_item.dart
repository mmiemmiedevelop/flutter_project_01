class Item {
  final String id; // 상품 ID
  final String image; // 이미지 URL 또는 경로
  final String name; // 상품명
  final int price; // 가격
  final String? desc; // 설명(옵셔널)

  Item({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.desc,
  });
}

// 사용 예시
// final item = Item(
//   id: '1',
//   image: 'https://example.com/image.png',
//   name: '샘플 상품',
//   price: 9900,
// );
