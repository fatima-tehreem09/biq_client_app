import 'dart:async';

import 'package:biq/src/components/auth/forgot/forgot_password_page.dart';
import 'package:biq/src/components/auth/home_page.dart';
import 'package:biq/src/components/auth/login/login_page.dart';
import 'package:biq/src/components/auth/register/register_page.dart';
import 'package:biq/src/components/error_page.dart';
import 'package:biq/src/components/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Roles {
  superAdminRole(0),
  businessAdminRole(1),
  businessUserRole(2),
  userRole(3),
  ;

  final int role;

  const Roles(this.role);
}

enum AppPages {
  onBoarding('OnBoarding', '/onBoarding'),
  registerPage('register', '/register'),
  signIn('sign-in', '/sign-in'),
  forgetPassword('forget-password', '/forget-password'),
  homePage('home-page', '/home-page'),
  ErrorPage('error-page', '/error-page'),
  ;

  final String name;
  final String path;

  const AppPages(this.name, this.path);
}

class AppNavigation {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: AppPages.onBoarding.path,
        name: AppPages.onBoarding.name,
        builder: (_, state) {
          return OnboardingPage();
        },
      ),
      GoRoute(
        path: AppPages.signIn.path,
        name: AppPages.signIn.name,
        builder: (_, state) {
          return LoginPage(isBusinessUser: false);
        },
      ),
      GoRoute(
        path: AppPages.registerPage.path,
        name: AppPages.registerPage.name,
        builder: (_, state) {
          return RegisterPage(isBusinessUser: false);
        },
      ),
      GoRoute(
        path: AppPages.forgetPassword.path,
        name: AppPages.forgetPassword.name,
        builder: (_, state) {
          return ForgotPasswordPage(isBusinessUser: false);
        },
      ),
      GoRoute(
        path: AppPages.homePage.path,
        name: AppPages.homePage.name,
        builder: (_, state) {
          return HomePage();
        },
      ),
    ],
    // errorBuilder: ,
    initialLocation: AppPages.onBoarding.path,
    errorPageBuilder: (BuildContext _, GoRouterState state) {
      return MaterialPage(
        child: ErrorPage(),
      );
    },
    // redirect:redirect(),
    // redirect: (_, state) => _.push(AppPages.ErrorPage.path),
  );

  static GoRouter get router => _router;
  //static Future<FutureOr<String?>> get _redirect=>redirect();

  static Future<FutureOr<String?>> redirect(
      BuildContext _, GoRouterState state) async {
    return AppPages.ErrorPage.path;
    return null;
  }

  static void goNamed(
    AppPages appPages, {
    Object? extra,
    Map<String, String>? query,
    Map<String, String>? path,
  }) {
    _router.goNamed(
      appPages.name,
      extra: extra,
      pathParameters: path ?? <String, String>{},
      queryParameters: query ?? <String, String>{},
    );
  }

  static void goPush(AppPages appPages) {
    _router.go(appPages.path);
  }

  static void replace(AppPages appPages) {
    _router.pushReplacement(appPages.path);
  }
}

// abstract class Redirection {
//   static Future<FutureOr<String?>> redirect(
//       BuildContext _, GoRouterState state) async {
//     final bool isSignedIn = await AppData.getIsLogIn() ?? false;
//     final isSignedInRoute = state.path == AppPages.signIn.path;
//     final isSignedUpRoute = state.path == AppPages.registerPage.path;
//
//     final isForgotRoute = state.path == AppPages.forgetPassword.path;
//     final isWelcomeRoute = state.path == AppPages.onBoarding.path;
//     final isHomePageRoute = state.path == AppPages.homePage.path;
//     //final isAddInstituteRoute = state.subloc == addInstitutionPage.value;
//
//     if (!isSignedIn) {
//       // if (AppData.isFuseBurnt == false) {
//       //   if (isWelcomeRoute) {
//       //     return null;
//       //   }
//       //   return welcomePage.value;
//       // }
//       if (isSignedInRoute) {
//         return null;
//       } else {
//         if (isSignedUpRoute || isForgotRoute || isHomePageRoute) {
//           return null;
//         }
//         return loginPage.value;
//       }
//     }
//     if (isSignedInRoute || isWelcomeRoute || isSignedUpRoute || isForgotRoute) {
//       return homePage.value;
//     }
//     return null;
//   }
// }
