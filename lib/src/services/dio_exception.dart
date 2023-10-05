import "package:dio/dio.dart";

class AppDioError implements Exception {
  late String title;
  late String description;
  AppDioError({required this.description, required this.title});
  AppDioError.withDioError(error) {
    title = "Error";
    description = "";
    if (error is DioException) {
      print('here ${error.response?.statusCode}');
      if ((error.response?.statusCode ?? 0) == 400) {
        if (error.response?.data is String) {
          description = error.response?.data['message'] ?? "Data not found";
        } else {
          description =
              error.response?.data["message"]?.first ?? "Data not found";
        }
      } else if ((error.response?.statusCode ?? 0) == 406) {
        description = "Account already exists";
      } else if ((error.response?.statusCode ?? 0) == 401) {
        description = "Wrong sign in credentials";
      } else if (error.message!.contains("SocketException") ||
          error.message!.contains("Connecting timed")) {
        description = "Internet Connection Error";
      } else {
        description = "Internet Connection Error";
      }
    } else {
      description = error.toString();
    }
  }
}
