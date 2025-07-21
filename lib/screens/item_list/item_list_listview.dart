import 'package:flutter/material.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page.dart';

class ItemListListView extends StatelessWidget {
  final String id; // 상품 ID
  final String image; // 이미지 URL 또는 경로
  final String name; // 상품명
  final int price; // 가격

  const ItemListListView({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상품 목록')),
      body: const ItemListPage(
        // 여기에 필요한 파라미터를 추가하세요
        // 예: id, image, name, price 등
      ),
    );
  }
}
