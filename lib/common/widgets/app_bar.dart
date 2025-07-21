import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/colors.dart';
import 'package:flutter_project_01/screens/cart/cart_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showLogo;
  final bool showCart;

  const CustomAppBar({
    super.key,
    this.showBackButton = true,
    this.showLogo = true,
    this.showCart = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 1,
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Image.asset(
                'assets/images/arrow-left.png',
                width: 24,
                height: 24,
              ),
            )
          : null,
      centerTitle: true,
      title: showLogo
          ? Image.asset('assets/images/logo.png', height: 80)
          : const SizedBox.shrink(),
      // actions: [
      //   if (showCart)
      //     Padding(
      //       padding: const EdgeInsets.only(right: 16),
      //       // child: GestureDetector(
      //       //   onTap: () {
      //       //     Navigator.push(
      //       //       context,
      //       //       MaterialPageRoute(
      //       //         builder: (context) => CartPage(
      //       //           // qty: 0, // 기본값 설정
      //       //           // name: '', // 기본값 설정
      //       //           // image: '', // 기본값 설정
      //       //         ),
      //       //       ),
      //       //     );
      //       //   },
      //         child: Image.asset(
      //           'assets/images/Vector.png',
      //           height: 32,
      //           width: 32,
      //           color: Colors.black,
      //           colorBlendMode: BlendMode.srcIn,
      //         ),
      //       ),
      //     ),
      // ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// 사용 방법
// import 'package:flutter_project_01/common/widgets/app_bar.dart';   << 맨 윗줄에 추가하여 위젯 사용 가능 상태로 만들기

// 그리고 아래 코드를 모두 복사하여 붙여넣기 한 다음에 맨 앞에 // 를 지우세요 (true를 하면 해당 값이 보이고 /false를 하면 해당 값이 보이지 않습니다)
// 예를 들어 뒤로 가기 버튼이 필요하지 않을 경우 showBackButton을 false로 !
// 장바구니 기능이 필요하지 않는다면 showCart를 false로 바꿔주세요


//  @override
 // Widget build(BuildContext context) {
   // return Scaffold(
     // appBar: const CustomAppBar(
       // showBackButton: true, // 뒤로가기 버튼
       // showLogo: true, // 로고
       // showCart: true, // 장바구니 버튼
      // ),
      // body: const Center(child: Text('첫 화면')),
    // );
  // }
// }