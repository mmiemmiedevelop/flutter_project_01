import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/app_bar.dart';
import 'package:flutter_project_01/screens/item_list/item_list_mock_data.dart';
import 'item_list_tile.dart';
import 'package:flutter_project_01/screens/item_detail/item_detail_page.dart'; // Added import for ItemDetailPage

class ItemListPageRefactor extends StatelessWidget {
  const ItemListPageRefactor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackButton: false,
        showLogo: true,
        showCart: true,
      ),
      body: ListView.builder(
        itemCount: ItemListMockData.getCartItems().length,
        itemBuilder: (context, index) {
          Widget tile = GestureDetector(
            onTap: () {
              //print(ItemListMockData.getCartItems()[index].item.name);//필요하면 주석해제후 사용하면됌
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Item_Detil(
                    cartItem: ItemListMockData.getCartItems()[index],
                  ),
                ),
              );
            },
            child: ItemListTile(
              cartItem: ItemListMockData.getCartItems()[index],
            ),
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
                      style: TextStyle(fontSize: 12, color: Colors.black54),
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
                      style: TextStyle(fontSize: 12, color: Colors.black54),
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
    );
  }
}
