import 'package:flutter/material.dart';
import 'package:flutter_project_01/screens/item_list/item_list_page_refactor.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: FirstPage()),
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // 2. 여기서 스플래시를 제거하는 함수를 호출합니다.
    removeSplashScreen();
  }

  void removeSplashScreen() async {
    // 필요한 경우 데이터 로딩 등을 여기서 await로 처리할 수 있습니다.
    // 예: await Future.delayed(const Duration(seconds: 1));

    // 스플래시 화면을 제거합니다.
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ItemListPageRefactor());
  }
}
