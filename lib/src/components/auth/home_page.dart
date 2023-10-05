import 'package:biq/src/services/AppData/app_data_credentials.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userID;
  String? userEmail;
  late AppData appData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    // if (!AppData.isInitialized()) {
    //   await AppData._initialize();
    // }
    userEmail = AppData.getEmail();
    print('object user email  $userEmail');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(child: Column()),
    );
  }
}
