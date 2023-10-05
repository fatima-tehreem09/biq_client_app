import 'package:flutter/material.dart';

// abstract class AppNavigation {
//   static Future<dynamic> push(
//     BuildContext context,
//     Widget widget,
//   ) async {
//     return await Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => widget));
//   }
//
//   static pushReplacement(
//     BuildContext context,
//     Widget widget,
//   ) {
//     return Navigator.pushAndRemoveUntil<dynamic>(
//       context,
//       MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => widget,
//       ),
//       (route) => false, //if you want to disable back feature set to false
//     );
//   }
//
//   static pop(BuildContext context, [dynamic data]) {
//     return Navigator.of(context).pop(data);
//   }
// }

class AppPage {
  final String _name;

  const AppPage._(this._name);

  static const homePage = AppPage._('/home-page');
}

abstract class AppNavigationWithoutRoutes {
  static Future<dynamic> push(
    BuildContext context,
    Widget page,
  ) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static Future<dynamic> pop(
    BuildContext context,
  ) async {
    return Navigator.of(context).pop();
  }

  static Future<dynamic> toReplace(
    BuildContext context,
    Widget page,
  ) async {
    return await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static Future<dynamic> toPage(
    BuildContext context,
    AppPage page,
  ) async {
    return await Navigator.of(context).pushNamed(page._name);
  }

  static Future<dynamic> replaceToPage(
    BuildContext context,
    AppPage page,
  ) async {
    return await Navigator.of(context).pushReplacementNamed(page._name);
  }

  static navigateRemoveUntil(
    BuildContext context,
    Widget page,
  ) {
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext con) => page,
      ),
      (route) => false,
    );
  }

  static final routes = <String, WidgetBuilder>{
    // AppPage.sessionPage._name: (context) => SessionPage(),
  };
}
