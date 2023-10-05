import 'dart:io';
import 'dart:math';

import 'package:biq/src/base/modals/app_snack_bar.dart';
import 'package:biq/src/base/nav.dart';
import 'package:biq/src/components/auth/register/image_pick_widget.dart';
import 'package:biq/src/services/auth/auth.dart';
import 'package:biq/src/widgets/app_layout_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/utils/input_validator.dart';

import '../../../base/modals/dialogs/dialog_error.dart';
import '../../../services/dio_exception.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../../utils/nav.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/text_field.dart';
import '../login/login_page.dart';
import 'image_text_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.isBusinessUser});

  final bool isBusinessUser;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with FormStateMixin {
  final _signUpRequest = SignupRequest(
    email: '',
    name: '',
    password: '',
    role: Roles.userRole.role,
    loginVia: 'Email',
    scopes: [''],
    username: '',
    contact: '',
    address: '',
    positionAtWork: 'work',
    isBusinessUser: false,
  );

  XFile? _file;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

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
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      if (type.isWebTab) const AppLogoWidget(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (!kIsWeb)
                              GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Image.asset(AppImages.backIcon,
                                      width: 27, height: 15)),
                            if (!isBusiness && type.isMobile)
                              GestureDetector(
                                onTap: () {
                                  // AppNavigation.push(
                                  //     context,
                                  //     const RegisterPage(
                                  //       isBusinessUser: true,
                                  //     ));
                                  AppNavigation.goPush(AppPages.registerPage);
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
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.white),
                                  ),
                                  child: ImagePickerWidget(
                                    size: 130,
                                    onImageSelection: (xFile) {
                                      print('object4567 ');
                                      // File(file!.path);
                                      _file = xFile;
                                      print(_file != null);
                                      print('object ');
                                    },
                                  ),
                                ),
                              ),
                            const ImageTextWidget(),
                            if (type.isMobile)
                              Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.white),
                                ),
                                child: ImagePickerWidget(
                                    size: 130,
                                    onImageSelection: (xFile) {
                                      print('object4567 ');
                                      _file = xFile;
                                      // xFile = xFile!;
                                      print('object qwertyu ');
                                    }),
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
                                child: AppTextField(
                                  hint: 'Enter your full name',
                                  textFieldUpperText: "Your Name",
                                  validator: InputValidator.required(),
                                  onSaved: (value) =>
                                      _signUpRequest.name = value!,
                                ),
                              ),
                            if (!isBusiness)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: AppTextField(
                                  validator: InputValidator.email(),
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (val) => _signUpRequest.email = val!,
                                  hint: 'Enter you email address',
                                  textFieldUpperText: "Email address",
                                ),
                              ),
                            if (!isBusiness)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: AppTextField(
                                    validator: InputValidator.required(),
                                    hint: 'Enter your position',
                                    textFieldUpperText: "Position at work"),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AppTextField(
                                  textEditingController: passwordController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                  hint: 'Set your password',
                                  textFieldUpperText: "Set Password"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AppTextField(
                                  textEditingController:
                                      confirmPasswordController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Password is required';
                                    } else if (val != passwordController.text) {
                                      return 'Enter correct pasword';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) =>
                                      _signUpRequest.password = val!,
                                  hint: 'Confirm your password',
                                  textFieldUpperText: "Confirm Password"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 30, top: 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: isSigningUp
                                  ? ApiButtonWidget()
                                  : AppButtonWidget(
                                      title: 'Create Account',
                                      onPressed: submitter,
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
                                // AppNavigation.push(
                                //     context,
                                //     LoginPage(
                                //         isBusinessUser:
                                //             isBusiness ? true : false));
                                AppNavigation.goPush(AppPages.signIn);
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
          ),
        );
      },
    );
  }

  bool isSigningUp = false;

  @override
  void onSubmit() async {
    setState(() {
      isSigningUp = true;
    });
    print('object on submit log in');
    if (formKey.currentState!.validate()) {
      try {
        print('object try');
        if (_file != null) {
          /// upload
          print('object try qwerty');
          final image = await AuthApi().uploadImage(File(_file!.path));
          final im = 'jjjjj';
          print('object try 123456 ${image.name}');
          _signUpRequest.image = image.name;
          print('object image ${_signUpRequest.image}');
        }
        print('object try sign up');
        final signUpResult = AuthApi().signUp(_signUpRequest);
        print('object  $signUpResult');
        AppNavigationWithoutRoutes.push(context,
            LoginPage(isBusinessUser: _signUpRequest.isBusinessUser ?? false));
      } on DioException catch (e) {
        ErrorDialog(error: AppDioError.withDioError(e)).show(context);
        print("dsdsdsd $e");
      }
    } else {
      $showSnackBar(context, 'Make sure to enter all the fields correctly');
    }

    setState(() {
      isSigningUp = false;
    });
  }
}
