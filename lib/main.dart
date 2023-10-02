import 'package:biq/src/components/auth/forgot/forgot_password_page.dart';
import 'package:biq/src/components/auth/login/login_page.dart';
import 'package:biq/src/components/auth/register/register_page.dart';
import 'package:biq/src/components/onboarding/onboarding_page.dart';
import 'package:biq/src/components/splash/splash_page.dart';
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
    return   MaterialApp(
      theme: ThemeData(
           primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home:  SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
