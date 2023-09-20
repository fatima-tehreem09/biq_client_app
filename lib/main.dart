import 'package:biq/src/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:reusables/utils/awaiter.dart';

import 'src/base/default_awaiter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Awaiter.defaultBehaviour = AppAwaitBehaviour();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
