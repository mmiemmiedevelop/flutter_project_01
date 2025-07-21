import 'package:flutter/material.dart';
import 'package:flutter_project_01/screens/cart/cart_widgets/cart_button_reused_widget.dart';

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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: CartButtonReusedWidget(
              onPressed: onShoppingPressed,
              buttonText: '쇼핑하러 가기',
            ),
          ),
        ),
      ],
    );
  }
}
