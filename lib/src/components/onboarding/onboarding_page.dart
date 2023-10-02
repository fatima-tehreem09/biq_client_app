import 'dart:math';

import 'package:biq/src/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';
import '../../utils/images.dart';
import '../../utils/nav.dart';
import '../../widgets/app_button_widget.dart';
import '../auth/login/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> imageUrls = [
    AppImages.logo,
    AppImages.logo,
    AppImages.logo,
    AppImages.logo,
  ];
  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder((context, type, width) {
      return Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30),
          child: Center(
            child: SizedBox(
              width: min(600, width),
              child: Column(
                children: [
                  if (type.isWebTab) const AppLogoWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if(type.isMobile)
                        GestureDetector(
                          onTap: () {
                            AppNavigation.navigateRemoveUntil(
                                context,
                                const LoginPage(
                                  isBusinessUser: false,
                                ));
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: AppColors.white),
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: imageUrls.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          height: 380,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: AssetImage(imageUrls[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildDots(),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum sunt in culpa qui.',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: AppColors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 100, top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: AppButtonWidget(
                                title: type.isMobile?'Next':"Skip",
                                onPressed: () {
                                  AppNavigation.navigateRemoveUntil(
                                      context,
                                      const LoginPage(
                                        isBusinessUser: false,
                                      ));
                                })),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < imageUrls.length; i++) {
      dots.add(_buildDot(i));
    }
    return dots;
  }

  Widget _buildDot(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      },
      child: Container(
        width: _currentPage == index ? 12.0 : 7.0,
        height: _currentPage == index ? 12.0 : 7.0,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? AppColors.greenShade : AppColors.white,
        ),
      ),
    );
  }
}
