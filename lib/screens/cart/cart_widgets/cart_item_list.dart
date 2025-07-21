import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/screens/cart/cart_widgets/cart_item_tile.dart';

class CartItemList extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(int, int) onQuantityChanged;
  final Function(int) onRemove;

  const CartItemList({
    super.key,
    required this.cartItems,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return CartItemTile(
          cartItem: cartItems[index],
          onQuantityChanged: (newQty) => onQuantityChanged(index, newQty),
          onRemove: () => onRemove(index),
        );
      },
    );
  }
}
