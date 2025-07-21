import 'package:flutter/material.dart';

class AppColors {
  // 연한 핑크색
  static const Color lightPink = Color(0xFFFCC2D7);

  // 핑크색
  static const Color pink = Color(0xFFD6336C);

  // 검정색
  static const Color black = Color(0xFF212529);

  // 회색
  static const Color gray = Color(0xFF868E96);

  // 연한 회색
  static const Color lightGray = Color(0xFFCED4DA);

  // 흰색
  static const Color white = Colors.white;
}


// 사용 방법
// import 'package:flutter_project_01/common/widgets/colors.dart'; << 맨 윗줄에 추가하여 위젯 사용 가능 상태로 만들기

// 예시로 아래 코드 보여드립니다 (복사 붙여넣기 금지)
// Container(
  // color: AppColors.pink, // 핑크색 배경
  // child: const Text(
    // 'Hello!',
    // style: TextStyle(color: AppColors.white), // 흰색 글자
 // ),
// )

// 위의 내용처럼 사용하고자 하는 곳에 AppColors.0000 <<< 0000에 색을 넣으세요
// lightPink / pink / black / gray / lightGray / white 총 6가지의 색을 넣을 수 있습니다