import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Container(
        height: 212,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEFF1F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ImageUploadIcon(),
      ),
    );
  }
}

// 이미지 업로드 박스 내 [이미지 등록 아이콘]
class ImageUploadIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/camera.png', scale: 4),
        SizedBox(height: 11),
        Text(
          "이미지 등록",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xff868E96),
          ),
        ),
      ],
    );
  }
}
