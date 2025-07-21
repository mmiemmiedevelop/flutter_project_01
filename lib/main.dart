import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/app_bar.dart';
import 'package:flutter_project_01/screens/item_add/item_add_page.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page_refactor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemListPageRefactor()
    );
  }
}

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         showBackButton: false,
//         showLogo: true,
//         showCart: true,
//       ),
//       body: const ItemListPage(),//⭐️커밋시 커밋안돼게 주의!!!!!!!⭐️
//     );
//   }
// }
