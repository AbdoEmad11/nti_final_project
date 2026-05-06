import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:nti_final_project/features/home/data/models/categories_model.dart';
import 'package:nti_final_project/features/home/data/models/offers_model.dart';
import 'package:nti_final_project/features/home/data/models/products_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  List<OfferModel> offers = [];

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(
        "https://accessories-eshop.runasp.net/api/products",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxYjc2ZTkxZi1iZGQ5LTRmNmYtNDI5ZS0wOGRlYTkwZjQ3MWUiLCJqdGkiOiIxMmJkNzdjMy1mMGJhLTQ5ZGItYTY2OC00YjNhNjcyOTFhM2EiLCJlbWFpbCI6ImFsemFtYWxlazIwMzAyMEBnbWFpbC5jb20iLCJuYW1lIjoiTW9oYW1lZCBGYXJpZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc3ODAyNzM0OCwiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.oEp7BIMlgWJ4A6njcEmXSHz5b3BcRkti7w2LA5vSJI4',
          },
        ),
      );

      final List data = response.data["items"];

      products = data.map((e) => ProductModel.fromJson(e)).toList();
      log("Success : ${response.data}");
      return products;
    } catch (e) {
      log("Error: $e");
      return [];
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(
        "https://accessories-eshop.runasp.net/api/categories",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxYjc2ZTkxZi1iZGQ5LTRmNmYtNDI5ZS0wOGRlYTkwZjQ3MWUiLCJqdGkiOiIxMmJkNzdjMy1mMGJhLTQ5ZGItYTY2OC00YjNhNjcyOTFhM2EiLCJlbWFpbCI6ImFsemFtYWxlazIwMzAyMEBnbWFpbC5jb20iLCJuYW1lIjoiTW9oYW1lZCBGYXJpZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc3ODAyNzM0OCwiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.oEp7BIMlgWJ4A6njcEmXSHz5b3BcRkti7w2LA5vSJI4',
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

  bool isOffersLoading = true;

  Future<List<OfferModel>> getOffers() async {
    try {
      final response = await dio.get(
        "https://accessories-eshop.runasp.net/api/offers",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxYjc2ZTkxZi1iZGQ5LTRmNmYtNDI5ZS0wOGRlYTkwZjQ3MWUiLCJqdGkiOiIxMmJkNzdjMy1mMGJhLTQ5ZGItYTY2OC00YjNhNjcyOTFhM2EiLCJlbWFpbCI6ImFsemFtYWxlazIwMzAyMEBnbWFpbC5jb20iLCJuYW1lIjoiTW9oYW1lZCBGYXJpZCIsInJvbGVzIjoiIiwicGljdHVyZSI6IiIsImV4cCI6MTc3ODAyNzM0OCwiaXNzIjoiZXNob3AubmV0IiwiYXVkIjoiZXNob3AubmV0In0.oEp7BIMlgWJ4A6njcEmXSHz5b3BcRkti7w2LA5vSJI4',
          },
        ),
      );

      final List data = response.data["offers"]["items"];

      offers = data.map((e) => OfferModel.fromJson(e)).toList();
      log("Success : ${response.data}");
      return offers;
    } catch (e) {
      log("Error offers: $e");
      return [];
    }
  }
}
