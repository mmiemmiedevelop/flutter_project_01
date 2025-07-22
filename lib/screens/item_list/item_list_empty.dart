import 'package:flutter/material.dart';

class ItemListEmptyPage extends StatelessWidget {
  const ItemListEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Vector2.png', width: 96, height: 96),
            SizedBox(height: 20),
            Text(
              '상품이 아직 없어요!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Column(
              children: const [
                Text(
                  '새로운 상품이 올 때까지',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  '조금만 기다려주세요',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
