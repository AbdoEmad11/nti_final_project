import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/network/api_error_handler.dart';
import 'package:nti_final_project/core/network/dio_client.dart';
import 'package:nti_final_project/features/home/data/models/categories_model.dart';
import 'package:nti_final_project/features/home/data/models/offers_model.dart';
import 'package:nti_final_project/features/home/data/models/products_model.dart';

class HomeRemoteDataSource {
  final Dio dio = DioClient.dio;

  Map<String, dynamic> get _paginationBody {
    return {
      'pageNumber': 1,
      'pageSize': 20,
    };
  }

  Future<Response<dynamic>> _getWithBody({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    return dio.request(
      path,
      data: body ?? _paginationBody,
      options: Options(
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _getWithBody(
        path: '/products',
        body: _paginationBody,
      );

      log('Products Response: ${response.data}');

      final data = _extractList(
        response.data,
        possibleKeys: const ['items', 'products', 'data'],
      );

      return data
          .whereType<Map<String, dynamic>>()
          .map(ProductModel.fromJson)
          .toList();
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Products Dio Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Products Error: $e');
      throw Exception('Failed to load products');
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _getWithBody(
        path: '/categories',
        body: _paginationBody,
      );

      log('Categories Response: ${response.data}');

      final data = _extractList(
        response.data,
        possibleKeys: const ['categories', 'items', 'data'],
      );

      return data
          .whereType<Map<String, dynamic>>()
          .map(CategoryModel.fromJson)
          .toList();
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Categories Dio Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Categories Error: $e');
      throw Exception('Failed to load categories');
    }
  }

  Future<List<OfferModel>> getOffers() async {
    try {
      final response = await _getWithBody(
        path: '/offers',
        body: _paginationBody,
      );

      log('Offers Response: ${response.data}');

      List data = [];

      if (response.data is Map<String, dynamic>) {
        final map = response.data as Map<String, dynamic>;

        if (map['offers'] is Map<String, dynamic>) {
          final offersMap = map['offers'] as Map<String, dynamic>;

          data = _extractList(
            offersMap,
            possibleKeys: const ['items', 'offers', 'data'],
          );
        } else {
          data = _extractList(
            map,
            possibleKeys: const ['offers', 'items', 'data'],
          );
        }
      } else if (response.data is List) {
        data = response.data as List;
      }

      return data
          .whereType<Map<String, dynamic>>()
          .map(OfferModel.fromJson)
          .toList();
    } on DioException catch (e) {
      final message = ApiErrorHandler.extract(e);
      log('Offers Dio Error: $message');
      throw Exception(message);
    } catch (e) {
      log('Offers Error: $e');
      throw Exception('Failed to load offers');
    }
  }

  List _extractList(
      dynamic responseData, {
        required List<String> possibleKeys,
      }) {
    if (responseData is List) {
      return responseData;
    }

    if (responseData is Map<String, dynamic>) {
      for (final key in possibleKeys) {
        final value = responseData[key];

        if (value is List) {
          return value;
        }

        if (value is Map<String, dynamic>) {
          for (final nestedKey in possibleKeys) {
            final nestedValue = value[nestedKey];

            if (nestedValue is List) {
              return nestedValue;
            }
          }
        }
      }
    }

    return [];
  }
}