import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/models/model_cart_item.dart';
import 'package:flutter_project_01/common/models/model_item.dart';
import 'package:flutter_project_01/screens/cart/cart_page.dart';
import 'package:flutter_project_01/screens/cart/cart_utils/cart_singleton.dart';

class Item_Detil extends StatefulWidget {
  final CartItem cartItem;
  const Item_Detil({super.key, required this.cartItem});

  @override
  State<Item_Detil> createState() => _Item_DetilState();
}

class _Item_DetilState extends State<Item_Detil> {
  // _Item_DetilState({required this.cartItem});
  CartItem? cartItem;
  int qty = 0;
  int price = 25000;
  int totarprice = 0;
  String? desc;
  String name = '럭키비키 001 츄리닝';
  String image = 'assets/images/01.png';

  void _addCounter() {
    //addCount 상태변화
    setState(() {
      qty++;
      totarprice = price * qty;
    });
  }

  void _subtractCounter() {
    //subtractCount 상태변화
    setState(() {
      qty--;
      totarprice = price * qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        toolbarHeight: 56,
        backgroundColor: Colors.white,
        title: const Text('상품 상세', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white, //배경색
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 315,
            width: 411.4,
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white, //배경색과 같이 설정
            child: ClipRRect(
              child: Image.asset(image, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 411.4,
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xFF1C1B1F),
              ),
            ),
          ),
          Container(
            width: 411.4,
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              '$price원',
              style: TextStyle(fontSize: 24, color: Color(0xFF1C1B1F)),
            ),
          ),
          Container(
            width: 411.4,
            height: 190,
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  width: 411.4,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                  color: Colors.white,
                  child: Text(
                    "\"당신도 001번 플레이어처럼 운명을 바꿔보세요\" 🏆 1등의 운을 담은 특별한 츄리닝 운명을 바꾼 전설의 001번을 재현한 한정판 ⚠️ 특별 주의사항 본 제품 착용 시 운이 급상승할 수 있습니다 001번의 운명은 본인 몫입니다 실제 456억원은 포함되지 않습니다 게임 참가권은 별매입니다",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 411.4,
            height: 50,
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            color: Colors.white, //총금액
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                const Text(
                  '수량',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(width: 210),
                IconButton(
                  onPressed: qty <= 0 ? null : _subtractCounter,

                  icon: Icon(Icons.remove),
                ),
                Text(
                  '$qty',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                IconButton(
                  onPressed: qty <= 98 ? _addCounter : null,
                  icon: Icon(Icons.add_outlined),
                ),
              ],
            ),
          ),
          Container(
            width: 411.4,
            height: 43,
            margin: EdgeInsets.only(left: 15, right: 15, top: 8),
            color: Colors.white, //총금액
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                const Text(
                  '총금액',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ), //나중에 총금액을 적을 자리
                ),
                SizedBox(width: 225),
                Text(
                  '${totarprice}원',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ), //나중에 총금액을 적을 자리
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 380,
            height: 50,
            decoration: ShapeDecoration(
              color: const Color(0xFFD6336C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    '장바구니 담기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                      letterSpacing: -0.32,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context,);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
