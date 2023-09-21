import 'package:biq/src/pages/auth_pages/register_page.dart';
import 'package:biq/src/utils/color.dart';
import 'package:biq/src/utils/images.dart';
import 'package:biq/src/utils/nav.dart';
import 'package:biq/src/widgets/app_button_widget.dart';
import 'package:biq/src/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(AppImages.backIcon,
                            width: 27, height: 15)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
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
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  textAlign: TextAlign.center,
                  'Nemo enim ipsam voluptatem quia voluptas sit',
                  style:
                      GoogleFonts.poppins(fontSize: 12, color: AppColors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      'Email address',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextField(hint: 'Enter you email address'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextField(hint: 'Enter your password'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 30, top: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: AppButtonWidget(
                            title: 'Reset Password', onPressed: () {})),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 0.3,
                  width: 61,
                  color: AppColors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Or login with',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: AppColors.white)),
                ),
                Container(
                  height: 0.3,
                  width: 61,
                  color: AppColors.white,
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 90),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    height: 36,
                    width: 36,
                    child: Image.asset(AppImages.google),
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Image.asset(AppImages.apple, color: Colors.white),
                  ),
                ]),
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
                        AppNavigation.push(
                            context, const RegisterPage(isBusinessUser: false));
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
    );
  }
}
