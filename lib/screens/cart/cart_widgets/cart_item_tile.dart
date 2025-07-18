import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/models/model_cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 104,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 1),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상품 이미지
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: SizedBox(
                  width: 104,
                  height: 104,
                  child: Image.asset(
                    cartItem.item.image,
                    width: 104,
                    height: 104,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 104,
                        height: 104,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // 상품 정보
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 상품명
                    const SizedBox(height: 10),
                    Text(
                      cartItem.item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 24),
                    // 수량 조절 위젯
                    QuantityControlWidget(
                      quantity: cartItem.qty,
                      onQuantityChanged: onQuantityChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 삭제 버튼 (우상단)
          Positioned(
            top: -4,
            right: -4,
            child: IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.close, color: Colors.grey, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            ),
          ),
          // 가격 (우하단)
          Positioned(
            bottom: 18,
            right: 14,
            child: Text(
              '${cartItem.totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}원',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 수량 조절 위젯
class QuantityControlWidget extends StatelessWidget {
  final int quantity;
  final Function(int) onQuantityChanged;

  const QuantityControlWidget({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 마이너스 버튼
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: IconButton(
              onPressed: () => onQuantityChanged(quantity - 1),
              icon: const Icon(
                Icons.remove,
                size: 12,
                color: Color(0xFF868E96),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          // 수량 표시
          Container(
            width: 40,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          // 플러스 버튼
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: IconButton(
              onPressed: () => onQuantityChanged(quantity + 1),
              icon: const Icon(
                Icons.add,
                size: 12,
                color: Colors.black,
                weight: 300,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }
}
