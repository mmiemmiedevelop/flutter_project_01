import 'package:flutter/material.dart';
import 'package:flutter_project_01/common/widgets/app_bar.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page_refactor.dart';

void main() {
  runApp(const MaterialApp(home: FirstPage()));
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemListPageRefactor()
    );
  }
}
