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

// 사용 방법
// import 'package:flutter_project_01/common/widgets/text_styles.dart'; << 맨 윗줄에 추가하여 위젯 사용 가능 상태로 만들기

// 예시 보여드립니다 (복사or붙여 넣기 금지)
// Text(
//  '기본 Pretendard',
//  style: AppTextStyles.pretendard(), << 이 코드는 복사하셔도 됩니다 이걸 가지고 오면 됩니다
// )

// 크기 + 굵기 조절을 하는 예시도 보여드립니다
// Text(
//  '제목 텍스트',
//  style: AppTextStyles.pretendard(fontSize: 24, fontWeight: FontWeight.bold), << ()괄호 안에 fontSize 추가해서 글자 크기 변경 가능
// )ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ + fontWeight: FontWeight.bold로 글자를 굵게 만들 수 있습니다
