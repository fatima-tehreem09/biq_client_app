// import 'package:biq/src/components/auth/home_page.dart';
// import 'package:biq/src/utils/color.dart';
// import 'package:biq/src/utils/images.dart';
// import 'package:biq/src/utils/nav.dart';
// import 'package:biq/src/widgets/app_button_widget.dart';
// import 'package:biq/src/widgets/text_field.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key, required this.isBusinessUser});
//
//   final bool isBusinessUser;
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   @override
//   Widget build(BuildContext context) {
//     var isBusiness = widget.isBusinessUser;
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       body: Center(
//         child: Container(
//           width: kIsWeb ? 450 : null,
//           padding:
//               EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 if (kIsWeb) const AppLogoWidget(),
//
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, top: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                           onTap: () => Navigator.of(context).pop(),
//                           child: Image.asset(AppImages.backIcon,
//                               width: 27, height: 15)),
//                       if (!isBusiness && !kIsWeb)
//                         GestureDetector(
//                           onTap: () {
//
//                             AppNavigation.push(
//                                 context,
//                                 const RegisterPage(
//                                   isBusinessUser: true,
//                                 ));
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 20),
//                             child: Text(
//                               'Business Account?',
//                               style: GoogleFonts.poppins(
//                                   fontSize: 12, color: AppColors.greenShade),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//                   child: Text(
//                     isBusiness ? 'Setup your Account' : 'Create your Account',
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.white),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 90),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     'Nemo enim ipsam voluptatem quia voluptas sit',
//                     style: GoogleFonts.poppins(
//                         fontSize: 12, color: AppColors.white),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                   child: Row(children: [
//                     if (kIsWeb)
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.all(60),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: AppColors.white),
//                         ),
//                         child: Icon(
//                           Icons.add,
//                           size: 20,
//                           color: AppColors.greenShade,
//                         ),
//                       ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             right: 10, left: kIsWeb ? 10 : 0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Add Profile Picture',
//                               style: GoogleFonts.poppins(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.white),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               'Nemo enim ipsam voluptatem quia voluptas sit',
//                               style: GoogleFonts.poppins(
//                                   fontSize: 12, color: AppColors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     if (!kIsWeb)
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.all(60),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: AppColors.white),
//                         ),
//                         child: Icon(
//                           Icons.add,
//                           size: 20,
//                           color: AppColors.greenShade,
//                         ),
//                       )
//                   ]),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, top: 20, bottom: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (!isBusiness)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: Text(
//                             'Your Name',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.white),
//                           ),
//                         ),
//                       if (!isBusiness)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: AppTextField(hint: 'Enter your full name'),
//                         ),
//                       if (!isBusiness)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: Text(
//                             'Email address',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.white),
//                           ),
//                         ),
//                       if (!isBusiness)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: AppTextField(hint: 'Enter you email address'),
//                         ),
//                       if (!isBusiness)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: Text(
//                             'Position at work',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.white),
//                           ),
//                         ),
//                       if (!isBusiness)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 10),
//                           child: AppTextField(hint: 'Enter your position'),
//                         ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           'Set Password',
//                           style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.white),
//                         ),
//                       ),
//                       AppTextField(hint: 'Set your password'),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           'Confirm Password',
//                           style: GoogleFonts.poppins(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.white),
//                         ),
//                       ),
//                       AppTextField(hint: 'Confirm your password'),
//                     ],
//                   ),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, bottom: 30, top: 50),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                           child: AppButtonWidget(
//                               title: 'Create Account', onPressed: () {
//                           })),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, bottom: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         !isBusiness
//                             ? 'Already a User? '
//                             : 'Already a Business User? ',
//                         style: GoogleFonts.poppins(
//                             fontSize: 12, color: AppColors.white),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           AppNavigation.push(
//                               context,
//                               LoginPage(
//                                   isBusinessUser: isBusiness ? true : false));
//                         },
//                         child: Text(
//                           'Login!',
//                           style: GoogleFonts.poppins(
//                               fontSize: 12, color: AppColors.greenShade),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (!isBusiness && kIsWeb)
//                   GestureDetector(
//                     onTap: () {
//                       AppNavigation.push(
//                           context,
//                           const RegisterPage(
//                             isBusinessUser: true,
//                           ));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 0, bottom: 30),
//                       child: Text(
//                         'Business Account?',
//                         style: GoogleFonts.poppins(
//                             fontSize: 12, color: AppColors.greenShade),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
