import 'dart:async';

import 'package:biq/src/pages/onboard_page.dart';
import 'package:biq/src/utils/color.dart';
import 'package:biq/src/utils/images.dart';
import 'package:biq/src/utils/nav.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;

      AppNavigation.toReplace(context, const OnBoardPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 34),
          child: Image.asset(AppImages.logo, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
