import 'dart:math';

import 'package:biq/src/utils/color.dart';
import 'package:biq/src/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          min(200, MediaQuery.sizeOf(context).width - 80),
          60,
        ),
        backgroundColor: AppColors.greenShade,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.bold)),
    );
  }
}

class ApiButtonWidget extends StatelessWidget {
  const ApiButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 80,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.greenShade,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          'Please wait......',
          style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 60,
      child: Image.asset(AppImages.logo),
    );
  }
}
