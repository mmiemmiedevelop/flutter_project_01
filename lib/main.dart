import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/app_bar.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page.dart';

void main() {
  runApp(const MaterialApp(home: FirstPage()));
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
        showLogo: true,
        showCart: true,
      ),
      body: const ItemListPage(),//⭐️커밋시 커밋안돼게 주의!!!!!!!⭐️
    );
  }
}
