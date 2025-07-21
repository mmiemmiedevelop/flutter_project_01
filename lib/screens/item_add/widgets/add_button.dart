import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/colors.dart';

class AddButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final Map<String, dynamic>? itemData; // 저장할 상품 데이터
  final String? successMessage; // 성공 메시지 (선택적)

  const AddButton({
    this.text = "등록하기",
    required this.isEnabled,
    this.itemData,
    this.successMessage = "상품이 등록되었습니다!",
  });

  // 저장 처리 함수
  void _handleSave(BuildContext context) {
    // 데이터 유효성 재확인
    if (!isEnabled || itemData == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 정보를 입력해주세요'), backgroundColor: Colors.red),
      );
      return;
    }

    // 성공 메시지 표시
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(successMessage ?? '저장되었습니다!'),
        backgroundColor: Colors.green,
      ),
    );

    // 이전 페이지로 이동 (저장된 데이터와 함께)
    Navigator.pop(context, itemData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isEnabled ? () => _handleSave(context) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isEnabled ? AppColors.pink : AppColors.gray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
