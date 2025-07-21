import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/text_styles.dart';
import 'package:flutter_project_01/screens/item_add/widgets/add_button.dart';
import 'package:flutter_project_01/screens/item_add/widgets/image_upload.dart';
import 'package:flutter_project_01/screens/item_add/widgets/user_input.dart';

class ItemAdd extends StatefulWidget {
  @override
  State<ItemAdd> createState() => _ItemAddState();
}

class _ItemAddState extends State<ItemAdd> {
  // 상품 등록에 필요한 상태 변수
  String itemName = "";
  int itemPrice = 0;
  String itemDesc = "";
  String? itemImage;

  // 모든 필드가 채워졌는지 확인하는 함수
  bool get isAllFieldsFilled {
    return itemName.isNotEmpty &&
        itemPrice > 0 &&
        itemDesc.isNotEmpty &&
        itemImage != null;
  }

  // 상품 데이터를 Map으로 만들어서 전달
  Map<String, dynamic>? get itemData {
    if (!isAllFieldsFilled) return null;

    return {
      'name': itemName,
      'price': itemPrice,
      'description': itemDesc,
      'image': itemImage,
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 화면을 탭하면 키보드가 내려가도록 설정
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "상품 등록",
            style: AppTextStyles.pretendard(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              'assets/images/arrow-left.png',
              width: 24,
              height: 24,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(color: Colors.grey, height: 1.0),
          ),
        ),

        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            // 이미지 등록 필드
            ImageUpload(
              onImageSelected: (imagePath) {
                setState(() {
                  itemImage = imagePath;
                });
              },
            ),

            // 상품 등록 정보 입력 필드
            SizedBox(height: 20),
            SectionTitle("이름"),
            SizedBox(height: 10),
            ItemNameField(
              hintText: "상품 이름을 입력해주세요",
              onChanged: (value) {
                setState(() {
                  itemName = value;
                });
              },
            ),

            SizedBox(height: 20),
            SectionTitle("가격"),
            SizedBox(height: 10),
            ItemPriceField(
              hintText: "숫자만 입력해주세요",
              onChanged: (value) {
                setState(() {
                  itemPrice =
                      int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), '')) ??
                      0;
                });
              },
            ),

            SizedBox(height: 20),
            SectionTitle("자세한 설명"),
            SizedBox(height: 10),
            ItemDescField(
              hintText: "상품에 대해 자세하게 설명해주세요",
              onChanged: (value) {
                setState(() {
                  itemDesc = value;
                });
              },
            ),
            SizedBox(height: 100),
          ],
        ),

        // 등록하기 버튼
        bottomNavigationBar: AddButton(
          isEnabled: isAllFieldsFilled,
          itemData: itemData, // 상품 데이터 전달
          successMessage: "상품이 성공적으로 등록되었습니다! 🎉",
        ),
      ),
    );
  }
}
