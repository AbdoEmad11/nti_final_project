import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/network/api_error_handler.dart';
import 'package:nti_final_project/core/network/dio_client.dart';
import 'package:nti_final_project/features/addProduct/data/models/create_product_request.dart';

class AddProductRemoteDataSource {
  final Dio dio = DioClient.dio;

  Future<Map<String, dynamic>> addProduct(CreateProductRequest request) async {
    try {
      final response = await dio.post('/products', data: request.toJson());
      log('Add Product Response: ${response.data}');

      if (response.data is Map<String, dynamic>) {
        return Map<String, dynamic>.from(response.data);
      }

      return {'message': 'Product added successfully'};
    } on DioException catch (e) {
      throw Exception(ApiErrorHandler.extract(e));
    } catch (_) {
      throw Exception('Failed to add product');
    }
  }
}
