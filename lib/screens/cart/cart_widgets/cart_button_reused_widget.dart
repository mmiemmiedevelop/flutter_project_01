import 'package:flutter/material.dart';

class CartButtonReusedWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;
  final bool isFullWidth;
  final String? defaultMessage; // 스낵바 메세지

  const CartButtonReusedWidget({
    super.key,
    this.onPressed,
    this.buttonText = '구매하기',
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.textStyle,
    this.isFullWidth = true,
    this.defaultMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed:
            onPressed ??
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(defaultMessage ?? '구매가 완료되었습니다!'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFD6336C),
          foregroundColor: foregroundColor ?? Colors.white,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          elevation: elevation ?? 0,
        ),
        child: Text(
          buttonText,
          style:
              textStyle ??
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
