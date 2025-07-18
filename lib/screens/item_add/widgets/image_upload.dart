import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/text_styles.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  ImagePicker picker = ImagePicker();
  File? image;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: GestureDetector(
        onTap: () => pickImage(ImageSource.gallery),
        child: Container(
          height: 212,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEFF1F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: image != null
              ? ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.file(image!, fit: BoxFit.cover),
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
