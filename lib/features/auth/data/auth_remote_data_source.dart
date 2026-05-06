import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:nti_final_project/core/network/api_error_handler.dart';
import 'package:nti_final_project/core/network/dio_client.dart';
import 'package:nti_final_project/core/utils/app_constants.dart';

class AuthRemoteDataSource {
  final Dio dio = DioClient.dio;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final requestData = {
        'email': email,
        'password': password,
      };

      log('Login Request Data: $requestData');

      final response = await dio.post(
        '/auth/login',
        data: requestData,
      );

      log('Login Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {
        'message': 'Login successful',
      };
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Login Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Login Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final requestData = {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      };

      log('Register Request Data: $requestData');

      final response = await dio.post(
        '/auth/register',
        data: requestData,
      );

      log('Register Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {
        'message': 'Register successful',
      };
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Register Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Register Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }

  Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    try {
      final requestData = {
        'email': email,
      };

      log('Forgot Password Request Data: $requestData');

      final response = await dio.post(
        '/auth/forgot-password',
        data: requestData,
      );

      log('Forgot Password Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {
        'message': 'Code sent successfully',
      };
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Forgot Password Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Forgot Password Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final requestData = {
        'email': email,
        'otp': otp,
      };

      log('Verify OTP Request Data: $requestData');

      final response = await dio.post(
        '/auth/verify-email',
        data: requestData,
      );

      log('Verify OTP Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {
        'message': 'OTP verified successfully',
      };
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Verify OTP Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Verify OTP Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }

  Future<String> resendOtp(String email) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}/auth/resend-otp'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return data['message']?.toString() ?? 'OTP sent successfully';
      }

      return data['message']?.toString() ?? 'Something went wrong';
    } catch (e) {
      log('Resend OTP Error: $e');
      return 'Network error';
    }
  }

  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final requestData = {
        'email': email,
        'newPassword': newPassword,
        'confirmNewPassword': confirmNewPassword,
      };

      log('Reset Password Request Data: $requestData');

      final response = await dio.post(
        '/auth/reset-password',
        data: requestData,
      );

      log('Reset Password Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {
        'message': 'Password reset successfully',
      };
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Reset Password Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Reset Password Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }

  Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final requestData = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmNewPassword': confirmPassword,
      };

      log('Change Password Request Data: $requestData');

      final response = await dio.post(
        '/auth/change-password',
        data: requestData,
      );

      log('Change Password Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {
        'message': 'Password changed successfully',
      };
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Change Password Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Change Password Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }
}