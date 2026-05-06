import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final Dio dio = Dio();

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      log(currentPassword);
      log(newPassword);
      log(confirmPassword);
      final Response response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/change-password",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxYjc2ZTkxZi1iZGQ5LTRmNmYtNDI5ZS0wOGRlYTkwZjQ3MWUiLCJqdGkiOiI0NDMyYWYzMC03ZGZiLTQxNDgtODRhMS01MGE1YjIyMmQ5ZDYiLCJlbWFpbCI6ImFsemFtYWxlazIwMzAyMEBnbWFpbC5jb20iLCJuYW1lIjoiTW9oYW1lZCBGYXJpZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc3ODA0NTk3NiwiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.gy8XJeVu_0UmixHuVCEEz6azPkc9Svw7uBmsL63A4xE',
          },
        ),
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmNewPassword": confirmPassword,
        },
      );

      log("Response : $response");
    } on DioException catch (e) {
      log("Exception1 : $e");
      throw Exception("Exception1 : ${e.response?.data}");
    } on Exception catch (e) {
      log("Exception2 : $e");
      throw Exception("Exception1 : $e");
    }
  }

  Future<void> otpVerify({
    required String email,
    required String getOtp,
  }) async {
    try {
      final Response response = await dio.post(
        "https://accessories-eshop.runasp.net/api/auth/verify-email",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxYjc2ZTkxZi1iZGQ5LTRmNmYtNDI5ZS0wOGRlYTkwZjQ3MWUiLCJqdGkiOiI0NDMyYWYzMC03ZGZiLTQxNDgtODRhMS01MGE1YjIyMmQ5ZDYiLCJlbWFpbCI6ImFsemFtYWxlazIwMzAyMEBnbWFpbC5jb20iLCJuYW1lIjoiTW9oYW1lZCBGYXJpZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc3ODA0NTk3NiwiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.gy8XJeVu_0UmixHuVCEEz6azPkc9Svw7uBmsL63A4xE',
          },
        ),

        data: {"email": email, "otp": getOtp},
      );
      log("Response : $response");
    } on DioException catch (e) {
      log("Exception : ${e.response?.data}");
      throw Exception("Exception1 : ${e.response?.data}");
    } on Exception catch (e) {
      log("Exception : $e");
      throw Exception("Exception1 : $e");
    }
  }

  final String baseUrl = "https://accessories-eshop.runasp.net";

  Future<String> resendOtp(String email) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/auth/resend-otp"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"email": email}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return data["message"] ?? "OTP sent successfully";
      }

      return data["message"] ?? "Something went wrong";
    } catch (e) {
      return "Network error";
    }
  }
}
