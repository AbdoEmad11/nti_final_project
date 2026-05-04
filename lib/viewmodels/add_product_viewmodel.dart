import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../core/services/api_service.dart';
import '../core/services/product_api_service.dart';
import '../core/validators/product_validator.dart';

class AddProductViewModel extends ChangeNotifier {
  // Services
  late final ProductApiService _productApiService;
  late final ApiService _apiService;

  // State variables
  String _productName = '';
  double _price = 0.0;
  String _selectedCategory = '';
  int _stockQuantity = 0;
  String _description = '';
  bool _isLoading = false;
  String _successMessage = '';

  // Validation errors
  Map<String, String> _validationErrors = {};

  // Getters
  String get productName => _productName;
  double get price => _price;
  String get selectedCategory => _selectedCategory;
  int get stockQuantity => _stockQuantity;
  String get description => _description;
  bool get isLoading => _isLoading;
  String get successMessage => _successMessage;
  Map<String, String> get validationErrors => _validationErrors;

  String? getError(String field) => _validationErrors[field];

  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Home & Garden',
    'Sports',
    'Books',
    'Toys',
  ];

  // Constructor
  AddProductViewModel() {
    _initializeServices();
  }

  // Initialize services
  void _initializeServices() {
    _apiService = ApiService();
    _productApiService = ProductApiService(_apiService);
  }

  void setProductName(String value) {
    _productName = value;
    _validationErrors.remove('name');
    notifyListeners();
  }

  void setPrice(String value) {
    _price = double.tryParse(value) ?? 0.0;
    _validationErrors.remove('price');
    notifyListeners();
  }

  void setCategory(String value) {
    _selectedCategory = value;
    _validationErrors.remove('category');
    notifyListeners();
  }

  void setStockQuantity(String value) {
    _stockQuantity = int.tryParse(value) ?? 0;
    _validationErrors.remove('quantity');
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    _validationErrors.remove('description');
    notifyListeners();
  }

  // Validate form
  bool validateForm() {
    _validationErrors = ProductValidator.validateAll(
      productName: _productName,
      price: _price.toString(),
      category: _selectedCategory,
      stockQuantity: _stockQuantity.toString(),
      description: _description,
    );
    notifyListeners();
    return _validationErrors.isEmpty;
  }

  // Add product
  Future<void> addProduct() async {
    if (!validateForm()) {
      return;
    }

    _isLoading = true;
    _successMessage = '';
    notifyListeners();

    try {
      final product = ProductModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _productName,
        price: _price,
        category: _selectedCategory,
        stockQuantity: _stockQuantity,
        description: _description,
      );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      print('✅ Product Added Successfully!');
      print('Product: ${product.toJson()}');

      _successMessage = 'Product added successfully!';
      clearForm();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('❌ Error adding product: $e');
      _validationErrors['api'] = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete product
  Future<bool> deleteProduct(String productId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      print('✅ Product Deleted Successfully!');
      _successMessage = 'Product deleted successfully!';
      clearForm();
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print('❌ Error deleting product: $e');
      _validationErrors['api'] = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Clear form
  void clearForm() {
    _productName = '';
    _price = 0.0;
    _selectedCategory = '';
    _stockQuantity = 0;
    _description = '';
    _validationErrors.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}