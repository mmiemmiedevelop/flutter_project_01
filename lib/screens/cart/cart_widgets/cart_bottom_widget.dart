import 'package:flutter/material.dart';
import 'package:flutter_project_01/screens/cart/cart_widgets/cart_button_reused_widget.dart';

class CartBottomWidget extends StatelessWidget {
  final int totalPrice;
  final VoidCallback? onPurchasePressed;

  const CartBottomWidget({
    super.key,
    required this.totalPrice,
    this.onPurchasePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 구분선
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
                // 총 가격 정보
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //[todo-sam] 가격 정보 텍스트 폰트 변경
                    const Text(
                      '총 가격 ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}원',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // 구매 버튼
                SizedBox(
                  width: double.infinity,
                  child: CartButtonReusedWidget(
                    onPressed: onPurchasePressed,
                    buttonText: '구매하기',
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
