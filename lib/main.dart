import 'package:biq/src/base/nav.dart';
import 'package:biq/src/services/AppData/app_data_credentials.dart';
import 'package:flutter/material.dart';
import 'package:reusables/utils/awaiter.dart';

import 'src/base/default_awaiter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Awaiter.defaultBehaviour = AppAwaitBehaviour();
  await AppData.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: AppNavigation.router,
      // home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
