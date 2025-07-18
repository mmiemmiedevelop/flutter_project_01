import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_project_01/screens/item_list/item_list_page.dart';
=======
import 'package:flutter_project_01/common/widgets/app_bar.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MaterialApp(home: FirstPage()));
}

<<<<<<< Updated upstream
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ItemListPage(),//⭐️커밋시 커밋안돼게 주의!!!!!!!⭐️
=======
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
      body: const Center(child: Text('첫 화면')),
>>>>>>> Stashed changes
    );
  }
}
