import 'package:flutter/material.dart';
import 'package:flutter_project_01/screens/cart/cart_widgets/cart_reused_button_widget.dart';

class CartEmptyWidget extends StatelessWidget {
  final VoidCallback? onShoppingPressed;

  const CartEmptyWidget({super.key, this.onShoppingPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 80,
                  color: const Color(0xFFD6336C),
                ),
                const SizedBox(height: 16),
                Text(
                  '장바구니가 비었어요',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '다양한 상품을 구경해보세요',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
        // 하단 구분선
        Container(
          height: 1,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF242424),
                offset: const Offset(0, -3),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
            color: Colors.transparent,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 0,
          ),
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                // 구매 버튼
                SizedBox(
                  width: double.infinity,
                  child: CartReusedButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: '쇼핑하러 가기',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}