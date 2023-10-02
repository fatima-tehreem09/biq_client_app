import 'dart:math';

import 'package:biq/src/widgets/app_layout_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../utils/nav.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/text_field.dart';
import '../login/login_page.dart';
import '../login_page.dart';
import 'image_pick_widget.dart';
import 'image_text_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.isBusinessUser});

  final bool isBusinessUser;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var isBusiness = widget.isBusinessUser;
    final padding = MediaQuery.paddingOf(context);
    return AppLayoutBuilder(
      (_, type, width) {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: padding.top + 20),
            child: Center(
              child: SizedBox(
                width: min(600, width),
                child: Column(
                  children: [
                    if (type.isWebTab) const AppLogoWidget(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if(!kIsWeb)
                          GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Image.asset(AppImages.backIcon,
                                  width: 27, height: 15)),
                          if (!isBusiness && type.isMobile)
                            GestureDetector(
                              onTap: () {
                                AppNavigation.push(
                                    context,
                                    const RegisterPage(
                                      isBusinessUser: true,
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  'Business Account?',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: AppColors.greenShade),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Text(
                        'Create your Account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Nemo enim ipsam voluptatem quia voluptas sit',
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Row(
                        children: [
                          if (type.isWebTab)
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: ImagePickerWidget(
                                size: type.isMobile ? 130 : 100,
                              ),
                            ),
                          const ImageTextWidget(),
                          if (type.isMobile)
                            ImagePickerWidget(
                              size: type.isMobile ? 140 : 100,
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isBusiness)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AppTextField(hint: 'Enter your full name',textFieldUpperText: "Your Name"),
                            ),
                          if (!isBusiness)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AppTextField(
                                hint: 'Enter you email address',textFieldUpperText: "Email address",
                              ),
                            ),

                          if (!isBusiness)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AppTextField(hint: 'Enter your position',textFieldUpperText: "Position at work"),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: AppTextField(hint: 'Set your password',textFieldUpperText: "Set Password"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: AppTextField(hint: 'Confirm your password',textFieldUpperText: "Confirm Password"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 30,
                        top: 30
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: AppButtonWidget(
                              title: 'Create Account',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            !isBusiness
                                ? 'Already a User? '
                                : 'Already a Business User? ',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppNavigation.push(
                                  context,
                                  LoginPage(
                                      isBusinessUser:
                                          isBusiness ? true : false));
                            },
                            child: Text(
                              'Login!',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: AppColors.greenShade),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
