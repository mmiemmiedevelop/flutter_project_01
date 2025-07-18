import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle pretendard({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    double? height,
    Color? color,
    double letterSpacing = 0.0,
  }) {
    return TextStyle(
      fontFamily: 'Pretendard',
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height ?? _calculateLineHeight(fontSize),
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static double _calculateLineHeight(double size) {
    if (size == 24) return 1.0;
    if (size == 16) return 1.5;
    return 1.4; // 기본값
  }
}
