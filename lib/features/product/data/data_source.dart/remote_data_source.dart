import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/storage/token_storage.dart';
import 'package:nti_final_project/core/utils/app_constants.dart';
import 'package:nti_final_project/features/product/data/models/category_model.dart';

class RemoteDataSource {
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

  Future<Options> _authOptions() async {
    final token = await TokenStorage.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('User token not found. Please login again.');
    }

    return Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;

    log('Product Categories Status Code: ${e.response?.statusCode}');
    log('Product Categories Error Data: $data');

    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ??
          data['error']?.toString() ??
          data['title']?.toString() ??
          data['detail']?.toString() ??
          data.toString();
    }

    if (data is String) {
      return data;
    }

    return e.message ?? 'Something went wrong';
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(
        '/categories',
        options: await _authOptions(),
      );

      log("Product Categories Response: ${response.data}");

      final List data = response.data['categories'] ?? [];

      return data.map((element) {
        return CategoryModel.fromJson(element);
      }).toList();
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      log("Product Categories Dio Error: $message");
      throw Exception(message);
    } catch (e) {
      log("Product Categories Error: $e");
      throw Exception(e.toString());
    }
  }
}