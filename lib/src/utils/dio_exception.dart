// import 'package:dio/dio.dart';
//
// typedef ParseException = String Function(dynamic error);
//
// class DioException implements Exception {
//   DioException({
//     required this.title,
//     required this.description,
//   });
//
//   String description = '';
//   String title = '';
//
//   DioException.withDioError(dynamic error) {
//     if (error is DioError) {
//       if ((error.response?.statusCode ?? 0) == 400) {
//         title = 'No Data!';
//         description = error.response?.data['message'] ?? 'Data not found';
//       } else if ((error.response?.statusCode ?? 0) == 406) {
//         title = 'Account already exists';
//         description = error.response?.data['message'] ?? 'Data not found';
//       } else if ((error.response?.statusCode ?? 0) == 401) {
//         if (error.response?.data != null) {
//           title = 'Invalid credentials';
//           final m = error.response?.data['message'];
//           if (m == 'Please Login via Google') {
//             description =
//                 'Account with this email does not exist, try again with social login';
//           } else {
//             description = 'Email or password is incorrect';
//           }
//         } else {
//           title = 'Invalid credentials';
//           description = 'Email or password is incorrect';
//         }
//       } else if ((error.response?.statusCode ?? 0) == 409) {
//         title = 'Attention';
//         description =
//             error.response?.data['message'] ?? 'Number already exists';
//       } else if ((error.response?.statusCode ?? 0) == 500) {
//         title = 'Error';
//         description = 'Something went wrong';
//       } else if (error.message!.contains('SocketException') ||
//           error.message!.contains('Connecting timed')) {
//         title = 'No Internet connection';
//         description = 'You need internet connection for this feature';
//       } else {
//         title = 'No Internet connection';
//         description = 'You need internet connection for this feature';
//       }
//     } else {
//       title = 'Error';
//       description = error.toString();
//     }
//   }
// }
