import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/text_styles.dart';

// 인풋 제목
class SectionTitle extends StatelessWidget {
  String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.pretendard(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

// 이름 입력 필드
class NameInputField extends StatelessWidget {
  String hintText;

  NameInputField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        hintText: hintText,
      ),
    );
  }
}

// 가격 입력 필드
class PriceInputField extends StatelessWidget {
  String hintText;

  PriceInputField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        hintText: hintText,
      ),
    );
  }
}

// 자세한 설명 입력 필드
class DescInputField extends StatelessWidget {
  String hintText;

  DescInputField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        hintText: hintText,
      ),
    );
  }
}
