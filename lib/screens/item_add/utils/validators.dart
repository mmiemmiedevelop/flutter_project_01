import 'dart:io';

class Validators {
  // 상품 이름 검증
  static String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "상품명을 입력해주세요";
    }
    return null;
  }

  // 가격 검증
  static String? validatePrice(int price) {
    if (price <= 0) {
      return "올바른 가격을 입력해주세요";
    }
    // 숫자인지 확인
    if (!RegExp(r'^[0-9]+$').hasMatch(price.toString())) {
      return "숫자만 입력 가능합니다";
    }
    return null;
  }

  // 설명 검증
  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "상품 설명을 입력해주세요";
    }
    if (value.trim().length > 2000) {
      return "설명은 2000글자 이하여야 합니다";
    }
    return null;
  }

  // 이미지 검증
  static String? validateImage(File? image) {
    if (image == null) {
      return "이미지를 등록해주세요";
    }
    return null;
  }
}
