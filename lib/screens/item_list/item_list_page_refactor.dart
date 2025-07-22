import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/app_bar.dart';
import 'package:flutter_project_01/screens/item_list/item_list_mock_data.dart';
import 'package:flutter_project_01/screens/item_add/item_add_page.dart';
import 'item_list_tile.dart';
import 'package:flutter_project_01/screens/item_detail/item_detail_page.dart';
import 'package:flutter_project_01/screens/item_list/item_list_empty.dart';

class ItemListPageRefactor extends StatefulWidget {
  const ItemListPageRefactor({super.key});

  @override
  State<ItemListPageRefactor> createState() => _ItemListPageRefactorState();
}

class _ItemListPageRefactorState extends State<ItemListPageRefactor> {
  @override
  Widget build(BuildContext context) {
    final items = ItemListMockData.getCartItems();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackButton: false,
        showLogo: true,
        showCart: true,
      ),
      body: items.isEmpty
          ? const ItemListEmptyPage() // 아이템이 없을 때
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Widget tile = GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Item_Detil(cartItem: items[index]),
                      ),
                    );
                  },
                  child: ItemListTile(cartItem: items[index]),
                );

                if (index == 0) {
                  return Column(
                    children: [
                      // 오늘의 핫딜
                      const Padding(
                        padding: EdgeInsets.only(top: 33, left: 24, right: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '🔥 오늘의 핫딜',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD6336C),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '오늘 가장 인기 많은 상품이예요!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      tile,
                    ],
                  );
                } else if (index == 2) {
                  return Column(
                    children: [
                      // 상품 전체보기
                      const SizedBox(height: 24),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '상품 전체 보기',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '매일 새로운 상품이 올라가요!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      tile,
                    ],
                  );
                } else {
                  // 기본 타일
                  return tile;
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemAdd()),
          );
          if (result != null && result is Map<String, dynamic>) {
            ItemListMockData.addNewItem(result);
            setState(() {
              // 화면 새로고침
            });
          } else {
            print('result: $result');
          }
        },
        backgroundColor: Colors.transparent, // 배경을 투명하게 설정
        elevation: 0, // 그림자 제거
        child: Image.asset(
          'assets/images/item_add_icon.png',
          width: 64,
          height: 64,
        ),
      ),
    );
  }
}
