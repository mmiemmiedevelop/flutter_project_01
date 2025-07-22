import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/text_styles.dart';

class ImageUpload extends StatefulWidget {
  final Function(String)? onImageSelected; // 이미지 선택 후 호출되는 콜백
  const ImageUpload({this.onImageSelected});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

// 이미지 선택 
class _ImageUploadState extends State<ImageUpload> {
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedImage = ('assets/images/p6.png');
          });
        },
        child: Container(
          height: 212,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEFF1F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: selectedImage != null
              ? ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(selectedImage!, fit: BoxFit.cover),
                )
              : ImageUploadIcon(),
        ),
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
          style: AppTextStyles.pretendard(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff868E96),
          ),
        ),
      ],
    );
  }
}
