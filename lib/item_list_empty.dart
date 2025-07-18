import 'package:flutter/material.dart';

class ItemListEmptyPage extends StatelessWidget {
  const ItemListEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Image.asset('assets/logo.png', height: 80)],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/Vector.png',
                height: 32,
                width: 32,
                color: Colors.black,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Vector2.png', width: 96, height: 96),
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
