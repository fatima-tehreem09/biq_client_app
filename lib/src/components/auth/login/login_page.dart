import 'dart:math';

import 'package:biq/src/base/nav.dart';
import 'package:biq/src/widgets/app_layout_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/reusables.dart';

import '../../../base/modals/dialogs/dialog_error.dart';
import '../../../services/AppData/app_data_credentials.dart';
import '../../../services/auth/auth.dart';
import '../../../services/dio_exception.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  final bool isBusinessUser;

  const LoginPage({super.key, required this.isBusinessUser});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormStateMixin {
  bool isChecked = false;
  final _request = LoginRequest(password: '', email: '');

  @override
  Widget build(BuildContext context) {
    // Dio dio = Dio();
    // APIServices apiServices = APIServices(dio);

    var isBusiness = widget.isBusinessUser;
    final padding = MediaQuery.paddingOf(context);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: AppLayoutBuilder((_, type, width) {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: padding.top + 20),
            child: Center(
              child: SizedBox(
                width: min(600, width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (type.isWebTab) const AppLogoWidget(),
                    if (isBusiness)
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (!kIsWeb)
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Image.asset(
                                  AppImages.backIcon,
                                  width: 27,
                                  height: 15,
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (!isBusiness && type.isMobile)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   AppNavigation.push(
                              //       context,
                              //       const LoginPage(
                              //         isBusinessUser: true,
                              //       ));
                              // },
                              child: Text(
                                'Business User?',
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: AppColors.greenShade),
                              ),
                            ),
                            const SizedBox(width: 20)
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Text(
                        isBusiness ? 'Business User Login' : 'Login',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Enter you email address',
                        textFieldUpperText: 'Email address',
                        validator: InputValidator.email(),
                        onSaved: (value) => _request.email = value!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextField(
                        hint: 'Enter your password',
                        textFieldUpperText: "Password",
                        validator: InputValidator.required(),
                        onSaved: (value) => _request.password = value!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (type.isWebTab)
                            Checkbox(
                              activeColor: AppColors.greenShade,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          if (type.isWebTab)
                            const SizedBox(
                              width: 5,
                            ),
                          if (type.isWebTab)
                            Text(
                              'Remember me',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              // AppNavigation.push(
                              //     context,
                              //     const ForgotPasswordPage(
                              //         isBusinessUser: false));
                              AppNavigation.goPush(AppPages.forgetPassword);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.poppins(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: AppColors.greenShade),
                            ),
                          ),
                          const SizedBox(width: 20)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 30,
                        top: 50,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: isLoggingIn
                                ? ApiButtonWidget()
                                : AppButtonWidget(
                                    title: 'Login',
                                    onPressed: submitter,
                                  ),
                          ),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 50),
                              height: 36,
                              width: 36,
                              child: Image.asset(AppImages.google),
                            ),
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: Image.asset(AppImages.apple,
                                  color: Colors.white),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: type.isWebTab ? 10 : 30,
                      ),
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
                    if (!isBusiness && type.isWebTab)
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // AppNavigation.push(
                                //     context,
                                //     const LoginPage(
                                //       isBusinessUser: true,
                                //     ));
                                AppNavigation.goPush(AppPages.signIn);
                              },
                              child: Text(
                                'Business User?',
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
      }),
    );
  }

  bool isLoggingIn = false;
  @override
  void onSubmit() async {
    setState(() {
      isLoggingIn = true;
    });

    print('object on submit log in');
    try {
      print('object try');
      final res = await AuthApi().login(_request);
      print('object try abcdf');
      await AppData.saveEmail(SignupResponse().email ?? '');
      await AppData.saveUserID(SignupResponse().id ?? '');
      await AppData.saveIsLogIn(SignupResponse().status ?? false);
      // AppNavigation.push(context, HomePage());
      AppNavigation.goPush(AppPages.homePage);
    } on DioException catch (e) {
      ErrorDialog(error: AppDioError.withDioError(e)).show(context);
      print('object try 123456 error');
    }

    setState(() {
      isLoggingIn = false;
    });
  }
}
