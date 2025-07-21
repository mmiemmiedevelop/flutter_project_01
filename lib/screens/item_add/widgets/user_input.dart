import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_01/common/widgets/text_styles.dart';
import 'package:flutter_project_01/screens/item_add/utils/formatters.dart';
import 'package:flutter_project_01/screens/item_add/utils/validators.dart';

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

// 상품 이름 입력 필드
class ItemNameField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const ItemNameField({required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 탭 시 키보드 포커스
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: TextFormField(
        textInputAction: TextInputAction.done, // 완료 버튼 표시
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onChanged,
        validator: (value) => Validators.validateProductName(value), // null 체크
      ),
    );
  }
}

// 가격 입력 필드
class ItemPriceField extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;

  const ItemPriceField({required this.hintText, required this.onChanged});

  @override
  _ItemPriceFieldState createState() => _ItemPriceFieldState();
}

class _ItemPriceFieldState extends State<ItemPriceField> {
  final TextEditingController _controller = TextEditingController();

  void _formatPrice(String value) {
    // 숫자가 아닌 문자 제거
    String cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanValue.isNotEmpty) {
      int price = int.parse(cleanValue);
      // 천 단위 콤마 적용
      String formattedPrice = Formatters.formatPrice(price);

      _controller.value = TextEditingValue(
        text: formattedPrice,
        selection: TextSelection.collapsed(offset: formattedPrice.length),
      );

      widget.onChanged(cleanValue); // 원본 숫자만 전달
    } else {
      widget.onChanged('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 탭 시 키보드 포커스
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // 숫자만 입력
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          suffixText: '원',
        ),
        onChanged: _formatPrice,
        validator: (value) {
          if (value == null || value.isEmpty) return "가격을 입력해주세요";
          int price = Formatters.parsePrice(value);
          return Validators.validatePrice(price); // 숫자 체크
        },
      ),
    );
  }
}

// 상품 설명 입력 필드
class ItemDescField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  const ItemDescField({required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 탭 시 키보드 포커스
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: TextFormField(
        maxLines: 12,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onChanged,
        validator: (value) => Validators.validateDescription(value), // null 체크
      ),
    );
  }
}
