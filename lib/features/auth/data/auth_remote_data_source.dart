import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthRemoteDataSource {
  final Dio dio = Dio();
  List<dynamic> loginData = [];
  Future<void> login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/login',
        data: {'email': email, 'password': password},
      );
      log('Response: ${response.data}');
    } on Exception catch (e) {
      log('Error: $e');
      throw Exception('Failed to login: $e');
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: {
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
        },
      );
      log('Response: ${response.data}');
    } on DioException catch (e) {
      String errorMessage = e.response?.data.toString() ?? e.message.toString();
      log('Error: $errorMessage');
    } catch (e) {
      log('Error: $e');
    }
  }
  Future<void> forgotPassword({
    required String email,
   
  }) async {
    try {
      final response = await dio.post(
        'https://accessories-eshop.runasp.net/api/auth/forgot-password',
        data: {
          "email": email,
         
        },
      );
      log('Response: ${response.data}');
    } on DioException catch (e) {
      String errorMessage = e.response?.data.toString() ?? e.message.toString();
      log('Error: $errorMessage');
    } catch (e) {
      log('Error: $e');
    }
  }
}
