import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/core/storage/token_storage.dart';
import 'package:nti_final_project/core/utils/app_constants.dart';
import 'package:nti_final_project/features/home/data/models/categories_model.dart';
import 'package:nti_final_project/features/home/data/models/offers_model.dart';
import 'package:nti_final_project/features/home/data/models/products_model.dart';

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

  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  List<OfferModel> offers = [];

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
          data.toString();
    }

    return e.message ?? 'Something went wrong';
  }
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(
        '/products',
        options: await _authOptions(),
      );

      log("Products Response: ${response.data}");

      final List data = response.data["items"] ?? [];

      products = data.map((e) => ProductModel.fromJson(e)).toList();

      return products;
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      log("Products Dio Error: $message");
      throw Exception(message);
    } catch (e) {
      log("Products Error: $e");
      throw Exception(e.toString());
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(
        '/categories',
        options: await _authOptions(),
      );

      log("Categories Response: ${response.data}");

      final List data = response.data['categories'] ?? [];

      categories = data.map((e) => CategoryModel.fromJson(e)).toList();

      return categories;
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      log("Categories Dio Error: $message");
      throw Exception(message);
    } catch (e) {
      log("Categories Error: $e");
      throw Exception(e.toString());
    }
  }

  Future<List<OfferModel>> getOffers() async {
    try {
      final response = await dio.get(
        '/offers',
        options: await _authOptions(),
      );

      log("Offers Response: ${response.data}");

      final List data = response.data["offers"]?["items"] ?? [];

      offers = data.map((e) => OfferModel.fromJson(e)).toList();

      return offers;
    } on DioException catch (e) {
      final message = _extractErrorMessage(e);
      log("Offers Dio Error: $message");
      throw Exception(message);
    } catch (e) {
      log("Offers Error: $e");
      throw Exception(e.toString());
    }
  }
}