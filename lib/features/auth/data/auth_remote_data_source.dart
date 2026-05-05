import 'dart:developer';

import 'package:dio/dio.dart';

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
}
