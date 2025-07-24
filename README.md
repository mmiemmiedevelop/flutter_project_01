# 🦑 'SGSP(Squid Game Shopping Platform)\_app'

오징어 게임 콘셉트를 활용한 **굿즈 쇼핑 플랫폼 앱**입니다.  
**Flutter** 기반으로 제작되었으며, 상품 등록, 목록, 상세, 장바구니 및 결제 흐름을 체험할 수 있습니다.  
해당 앱은 **아이폰 16 pro**를 기반으로 최적화 및 개발되어 있으며  
해당 기종으로 플레이해 주시길 바랍니다.  

https://youtu.be/6y-soeMEE-o : 시연영상

<p align="center">
  <img src="docs/주요 기능.png" width="100%" alt="주요 기능 예시 이미지"/>
</p>

---

## 🔧 주요 기능 및 기능별 구현 위치

0️⃣ 공용 페이지  
  
상단바 타이틀 → common/widgets/app_bar.dart  
뒤로가기 버튼 → 전체적으로 Navigator.pop(context) 사용  
장바구니 버튼 → common/widgets/app_bar.dart  
  
1️⃣ 상품 목록 페이지 
  
상품 위젯 구성 → screens/item_list/item_list_tile.dart  
상품 등록 버튼 → screens/item_list/item_list_page.dart  
  
2️⃣ 상품 상세 페이지  
  
상품 구매 수량 조절 기능 → screens/item_detail/item_detail_page.dart  
총 가격 실시간 변동 → setState() 사용, 동일 파일  
장바구니 담기 버튼 → ElevatedButton, 동일 파일  
장바구니 담기 팝업 → showDialog(), 동일 파일  

3️⃣ 상품 등록 페이지  
  
상품 이미지 등록 기능 → screens/item_add/widgets/image_upload.dart  
상품 이름 입력 기능 → screens/item_add/widgets/user_input.dart  
상품 가격 입력 기능 → screens/item_add/widgets/user_input.dart  
상품 설명 입력 기능 → screens/item_add/widgets/user_input.dart  
상품 등록하기 버튼 → screens/item_add/widgets/add_button.dart  
상품 등록 완료 메세지 → ScaffoldMessenger.of(context).showSnackBar()  
  
4️⃣ 장바구니 페이지  
  
구매하기 버튼 → screens/cart/cart_page.dart  
구매 확인 팝업 → showDialog() 호출부, 동일 파일  
상품이 없을 경우 쇼핑하러 가기 버튼 → screens/cart/cart_widgets/cart_empty_widget.dart  

---

## 💻 사용 기술

- Flutter 3.32.7
- Dart 3.8.1
- 상단바 타이틀 : AppBar, Row, Text, Image.asset()
- 뒤로가기 버튼 : Navigator.pop(context)
- 장바구니 버튼 : IconButton, Icons.shopping_cart, Navigator.push()
- 상품 위젯 구성 : ListView.builder, Card, ClipRRect, Image.asset(), Text
- 상품 등록 버튼 : FloatingActionButton, Navigator.push()
- 상품 구매 수량 조절 기능 : IconButton, setState(), Text
- 총 가격 실시간 변동 : setState(), Text
- 장바구니 담기 버튼 : ElevatedButton, Navigator.push()
- 장바구니 담기 팝업 : showDialog(), AlertDialog, TextButton
- 상품 이미지 등록 기능 : ImagePicker, GestureDetector, Image.file(), showDialog()
- 상품 이름 입력 기능 : TextFormField, Form, Validator
- 상품 가격 입력 기능 : TextFormField (keyboardType: TextInputType.number)
- 상품 설명 입력 기능 : TextFormField (maxLines 설정)
- 상품 등록하기 버튼 : ElevatedButton, FormState.validate(), Navigator.pop()
- 상품 등록 완료 메세지 : ScaffoldMessenger.of(context).showSnackBar()
- 구매하기 버튼 : ElevatedButton
- 구매 확인 팝업 : showDialog(), AlertDialog, TextButton
- 상품이 없을 경우 쇼핑하러 가기 버튼 : 조건문 (if (cart.isEmpty)), TextButton, Navigator.push()

---

## 📁 폴더 구조

<pre>
assets/
├── etc/                          # Pretendard 폰트 모음
│   ├── Pretendard-Black.ttf
│   ├── Pretendard-Bold.ttf
│   ├── Pretendard-ExtraBold.ttf
│   ├── Pretendard-ExtraLight.ttf
│   ├── Pretendard-Light.ttf
│   ├── Pretendard-Medium.ttf
│   ├── Pretendard-Regular.ttf
│   ├── Pretendard-SemiBold.ttf
│   ├── Pretendard-Thin.ttf
│   └── PretendardVariable.ttf
├── images/                       # 앱 UI에 사용되는 이미지
│   ├── logo.png                  # 메인 로고
│   ├── camera.png                # 카메라 아이콘
│   ├── arrow-left.png            # 뒤로가기 화살표
│   ├── Vector.png
│   ├── Vector2.png
│   ├── item_add_icon.png         # 상품 등록 아이콘
│   ├── 01.png                    # 리스트용 이미지
│   └── p1.png ~ p6.png           # 샘플 상품 이미지
└── show_logo.png                 # 앱 상단 로고에 사용
lib/
├── main.dart
├── common/
│   ├── models/                   # 데이터 모델 정의
│   │   ├── model_cart_item.dart
│   │   └── model_item.dart
│   ├── themes/                   # 테마 정의
│   │   └── app_theme.dart
│   └── widgets/                  # 공통 위젯 모음
│       ├── app_bar.dart          # 커스텀 앱바
│       ├── background.dart       # 배경 위젯
│       ├── colors.dart           # 공통 색상 정의
│       └── text_styles.dart      # 텍스트 스타일 정의
└── screens/
    ├── cart/                     # 장바구니 기능 관련
    │   ├── cart_page.dart
    │   ├── cart_utils/
    │   │   ├── cart_helper.dart
    │   │   ├── cart_mock_data.dart
    │   │   └── cart_singleton.dart
    │   └── cart_widgets/
    │       ├── cart_bottom_widget.dart
    │       ├── cart_button_reused_widget.dart
    │       ├── cart_empty_widget.dart
    │       ├── cart_item_list.dart
    │       ├── cart_item_tile.dart
    │       └── cart_reused_button_widget.dart
    ├── item_add/                 # 상품 등록 관련
    │   ├── item_add_page.dart
    │   ├── utils/
    │   │   ├── formatters.dart
    │   │   └── validators.dart
    │   └── widgets/
    │       ├── add_button.dart
    │       ├── image_upload.dart
    │       └── user_input.dart
    ├── item_detail/
    │   └── item_detail_page.dart
    └── item_list/                # 상품 목록 관련
        ├── item_list_empty.dart
        ├── item_list_mock_data.dart
        ├── item_list_page.dart
        ├── item_list_page_refactor.dart
        └── item_list_tile.dart
</pre>

---

# 🔍 설치 및 실행 방법

## 프로젝트 클론

git clone https://github.com/mmiemmiedevelop/squid_game_shopping_platform.git  
cd squid_game_shopping_platform  

## 패키지 설치

flutter pub get

## 앱 실행

flutter run

※ 본 프로젝트는 교육 목적의 과제 제출용으로 작성되었습니다.

# 🙋‍♂️ 개발자

- **이샘** – [@mmiemmiedevelop](https://github.com/mmiemmiedevelop)
- **최은희** – [@PolarisAnnie](https://github.com/PolarisAnnie)
- **임우형** – [@kk20192073](https://github.com/kk20192073)
- **김태장** – [@wing72](https://github.com/wing72)
- **이성훈** – [@dondummy](https://github.com/dondummy)

  
