import 'api_service.dart';
import '../../models/product_model.dart';

class ProductApiService {
  final ApiService _apiService;

  ProductApiService(this._apiService);

  // Get all products
  Future<List<ProductModel>> getAllProducts({
    int? page,
    int? pageSize,
  }) async {
    try {
      final response = await _apiService.get(
        '/products',
        queryParameters: {
          if (page != null) 'page': page,
          if (pageSize != null) 'pageSize': pageSize,
        },
      );

      if (response is List) {
        return response
            .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      return [];
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }

  // Create product
  Future<ProductModel> createProduct(ProductModel product) async {
    try {
      final response = await _apiService.post(
        '/products',
        data: product.toJson(),
      );
      return ProductModel.fromJson(response);
    } catch (e) {
      print('Error creating product: $e');
      rethrow;
    }
  }

  // Delete product
  Future<void> deleteProduct(String id) async {
    try {
      await _apiService.delete('/products/$id');
    } catch (e) {
      print('Error deleting product: $e');
      rethrow;
    }
  }
}