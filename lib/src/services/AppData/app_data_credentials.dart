import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static late SharedPreferences _sharedPreferences;

  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveEmail(String value) async {
    await _sharedPreferences.setString('userEmail', value);
  }

  static Future<void> saveUserID(String val) async {
    await _sharedPreferences.setString('userID', val);
  }

  static String? getUserID() {
    return _sharedPreferences.getString('userID');
  }

  static String? getEmail() {
    return _sharedPreferences.getString('userEmail');
  }

  static bool? getIsLogIn() {
    return _sharedPreferences.getBool('isLogin');
  }

  static Future<void> saveIsLogIn(bool val) async {
    await _sharedPreferences.setBool('isLogIn', val);
  }
}
