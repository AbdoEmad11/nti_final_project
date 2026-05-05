import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_final_project/features/product/data/models/category_model.dart';
class RemoteDataSource {
  

Future<List<CategoryModel>> getCategories() async {
    try {
      final Dio dio = Dio();
      List<CategoryModel> categories = [];
      final response = await dio.get(
        "https://accessories-eshop.runasp.net/api/categories",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjM2IyMDI0Ny0yODdmLTQyNjgtNjczNy0wOGRlYTlmNjdkYmEiLCJqdGkiOiJiYmRlY2M4My05ZTE2LTRkNTctOWI0Mi03NDIwYWI0NWUyNTQiLCJlbWFpbCI6Im1hMjI2NjYxNEBnbWFpbC5jb20iLCJuYW1lIjoibW9oYW1lZCBhc2hyYWYiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3NzgyMzExNjQsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.SOblv3vD4nXvnYff_sTCRkr8wUms0Nu7rAPJeLcJvH8',
          },
        ),
      );

      categories.clear();
      for (var element in response.data['categories']) {
        categories.add(CategoryModel.fromJson(element));
      }
      log("Success : ${response.data}");
      return categories;
    } catch (e) {
      log("Error: $e");
      return [];
    }
  }
}