// import 'package:biq/src/components/auth/home_page.dart';
// import 'package:biq/src/utils/color.dart';
// import 'package:biq/src/utils/images.dart';
// import 'package:biq/src/utils/nav.dart';
// import 'package:biq/src/widgets/app_button_widget.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class OnBoardPage extends StatefulWidget {
//   const OnBoardPage({super.key});
//
//   @override
//   State<OnBoardPage> createState() => _OnBoardPageState();
// }
//
// class _OnBoardPageState extends State<OnBoardPage> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   final List<String> imageUrls = [
//     AppImages.logo,
//     AppImages.logo,
//     AppImages.logo,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       body: Center(
//         child: Container(
//           width: kIsWeb ? 450 : null,
//           margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 if (kIsWeb) const AppLogoWidget(),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           AppNavigation.navigateRemoveUntil(
//                               context,
//                               const LoginPage(
//                                 isBusinessUser: false,
//                               ));
//                         },
//                         child: Text(
//                           'Skip',
//                           style: GoogleFonts.poppins(
//                               fontSize: 16, color: AppColors.white),
//                         ),
//                       ),
//                       const SizedBox(width: 20)
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: PageView.builder(
//                     scrollDirection: Axis.horizontal,
//                     controller: _pageController,
//                     itemCount: imageUrls.length,
//                     onPageChanged: (index) {
//                       setState(() {
//                         _currentPage = index;
//                       });
//                     },
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 380,
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 20),
//                         padding: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           image: DecorationImage(
//                             image: AssetImage(imageUrls[index]),
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: _buildDots(),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum sunt in culpa qui.',
//                     style: GoogleFonts.poppins(
//                         fontSize: 12, color: AppColors.white),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, bottom: 100, top: 10),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(
//                           child: AppButtonWidget(
//                               title: 'Next',
//                               onPressed: () {
//                                 AppNavigation.navigateRemoveUntil(
//                                     context,
//                                     const LoginPage(
//                                       isBusinessUser: false,
//                                     ));
//                               })),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Widget> _buildDots() {
//     List<Widget> dots = [];
//     for (int i = 0; i < imageUrls.length; i++) {
//       dots.add(_buildDot(i));
//     }
//     return dots;
//   }
//
//   Widget _buildDot(int index) {
//     return GestureDetector(
//       onTap: () {
//         _pageController.animateToPage(index,
//             duration: const Duration(milliseconds: 200), curve: Curves.linear);
//       },
//       child: Container(
//         width: _currentPage == index ? 12.0 : 7.0,
//         height: _currentPage == index ? 12.0 : 7.0,
//         margin: const EdgeInsets.symmetric(horizontal: 3),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: _currentPage == index ? AppColors.greenShade : AppColors.white,
//         ),
//       ),
//     );
//   }
// }
