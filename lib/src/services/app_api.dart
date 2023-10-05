import 'package:dio/dio.dart';

class AppApi {
  static final client = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.4:4000/',
      headers: {'Content-Type': 'application/json', 'accept': '*/*'},
    ),
  );
}
