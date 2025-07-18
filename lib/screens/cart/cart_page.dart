import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/screens/cart/cart_utils/cart_mock_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // 장바구니 아이템 목록
  List<CartItem> cartItems = CartMockData.getCartItems();
  //List<CartItem> cartItems = CartMockData.getEmptyCart();

  // ----------------------------------------------------메소드-------------------------------------------------------------
 
  // ----------------------------------------------------메소드 종료-------------------------------------------------------------

  // ----------------------------------------------------빌드 시작-------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '장바구니',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // 장바구니 아이템 목록
          // 하단 결제 영역
        ],
      ),
    );
  }

  // ----------------------------------------------------빌드 종료-------------------------------------------------------------
}
