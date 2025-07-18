import 'package:flutter/material.dart';
import 'package:flutter_project_01/screens/item_add/widgets/add_button.dart';
import 'package:flutter_project_01/screens/item_add/widgets/image_upload.dart';
import 'package:flutter_project_01/screens/item_add/widgets/user_input.dart';

class ItemAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상품 등록"),
        // 뒤로 가기 버튼
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(
            'assets/images/arrow-left.png',
            width: 24,
            height: 24,
          ),
        ),
        // 앱바 하단 회색 선
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey, height: 1.0),
        ),
      ),

      //
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 등록 필드
            ImageUpload(),
            // 상품 등록 정보 입력 필드
            SizedBox(height: 20),
            SectionTitle("이름"),
            SizedBox(height: 10),
            NameInputField("상품 이름을 입력하세요"),
            SizedBox(height: 20),
            SectionTitle("가격"),
            SizedBox(height: 10),
            PriceInputField("숫자만 입력하세요"),
            SizedBox(height: 20),
            SectionTitle("자세한 설명"),
            SizedBox(height: 10),
            DescInputField("상품에 대해 자세하게 설명해주세요"),
          ],
        ),
      ),

      // 등록하기 버튼
      bottomNavigationBar: AddButton(),
    );
  }
}
