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
  int qty = 0; //카트에 담긴 수량 > addCart에서 씁니다
  int price = 25000;
  int totarprice = 0;
  String? desc;
  String name = '럭키비키 001 츄리닝';
  String image = 'assets/images/01.png';

  void _addCounter() {
    //addCount 상태변화
    setState(() {
      qty++;
      totarprice = widget.cartItem.item.price * qty;
    });
  }

  void _subtractCounter() {
    //subtractCount 상태변화
    setState(() {
      qty--;
      totarprice = widget.cartItem.item.price * qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //뒤로가기)
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        toolbarHeight: 56,
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
              child: Image.asset(
                '${widget.cartItem.item.image}',
                fit: BoxFit.cover,
              ),
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
              widget.cartItem.item.name,
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
              widget.cartItem.item.price == 0
                  ? '무료'
                  : '${_formatPrice(widget.cartItem.item.price)}원',
              style: TextStyle(fontSize: 24, color: Color(0xFF1C1B1F)),
            ),
          ),
          Container(
            width: 411.4,
            height: 120,
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  width: 411.4,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                  color: Colors.white,
                  child: Text(
                    widget.cartItem.item.desc ?? '',
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
                SizedBox(width: 190),
                IconButton(
                  onPressed: qty > 0 ? _subtractCounter : null,
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
                SizedBox(width: 205),
                Text(
                  '${_formatPrice(totarprice)}원',
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
                    Cart().add(qty); //[Todo]싱글톤으로 수량만 해놓은 부분 수정필요
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
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

String _formatPrice(int price) {
  return price.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  );
}
