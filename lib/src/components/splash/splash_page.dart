import 'dart:async';
import 'dart:math';

import 'package:biq/src/base/nav.dart';
import 'package:biq/src/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;

      // AppNavigation.toReplace(context, const OnboardingPage());
      AppNavigation.replace(AppPages.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppLayoutBuilder((context, deviceType, width) {
      return Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Container(
            color: Colors.red,
            width: min(600, width),
            margin: const EdgeInsets.symmetric(horizontal: 34),
            child: Image.asset(AppImages.logo, fit: BoxFit.cover),
          ),
        ),
      );
    });
  }
}
