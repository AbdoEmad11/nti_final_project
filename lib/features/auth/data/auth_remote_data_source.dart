import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nti_final_project/core/utils/app_constants.dart';

class AuthRemoteDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;

    log('Status Code: ${e.response?.statusCode}');
    log('Error Response Data: $data');

    if (data == null) {
      return e.message ?? 'Something went wrong';
    }

    if (data is String) {
      return data;
    }

    if (data is Map<String, dynamic>) {
      final errors = data['errors'];

      if (errors is Map<String, dynamic>) {
        final messages = <String>[];

        errors.forEach((key, value) {
          if (value is List) {
            for (final item in value) {
              messages.add('$key: $item');
            }
          } else {
            messages.add('$key: $value');
          }
        });

        if (messages.isNotEmpty) {
          return messages.join('\n');
        }
      }

      if (errors is List) {
        return errors.join('\n');
      }

      return data['message']?.toString() ??
          data['error']?.toString() ??
          data['title']?.toString() ??
          data['detail']?.toString() ??
          'Something went wrong';
    }

    return e.message ?? 'Something went wrong';
  }

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
      final message = _extractErrorMessage(e);
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
      final message = _extractErrorMessage(e);
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
      final message = _extractErrorMessage(e);
      log('Forgot Password Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Forgot Password Unknown Error: $e');
      throw Exception('Unexpected error happened');
    }
  }
}