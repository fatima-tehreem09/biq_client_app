import 'dart:math';

import 'package:biq/src/base/nav.dart';
import 'package:biq/src/widgets/app_layout_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, required this.isBusinessUser});

  final bool isBusinessUser;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    var isBusiness = widget.isBusinessUser;
    final padding = MediaQuery.paddingOf(context);

    return AppLayoutBuilder(
      (context, type, width) {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
            child: Center(
              child: SizedBox(
                width: min(600, width),
                child: Column(
                  children: [
                    if (type.isWebTab) const AppLogoWidget(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (!kIsWeb)
                            GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Image.asset(AppImages.backIcon,
                                    width: 27, height: 15)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Text(
                        'Reset Password',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Nemo enim ipsam voluptatem quia voluptas sit',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        hint: 'Enter you email address',
                        textFieldUpperText: "Email address",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: AppTextField(
                        hint: 'Enter your password',
                        textFieldUpperText: "Password",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 60, top: 50),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: AppButtonWidget(
                                  title: 'Reset Password', onPressed: () {})),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member? ',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: AppColors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              // AppNavigation.push(context,
                              //     const RegisterPage(isBusinessUser: false));
                              AppNavigation.goPush(AppPages.registerPage);
                            },
                            child: Text(
                              'Register Now!',
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
