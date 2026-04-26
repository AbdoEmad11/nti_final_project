import 'package:flutter/material.dart';
import '../models/product_model.dart';

class AddProductViewModel extends ChangeNotifier {
  // State variables
  String _productName = '';
  double _price = 0.0;
  String _selectedCategory = '';
  int _stockQuantity = 0;
  String _description = '';
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  String get productName => _productName;
  double get price => _price;
  String get selectedCategory => _selectedCategory;
  int get stockQuantity => _stockQuantity;
  String get description => _description;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Home & Garden',
    'Sports',
    'Books',
    'Toys',
  ];

  void setProductName(String value) {
    _productName = value;
    notifyListeners();
  }

  void setPrice(String value) {
    _price = double.tryParse(value) ?? 0.0;
    notifyListeners();
  }

  void setCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }

  void setStockQuantity(String value) {
    _stockQuantity = int.tryParse(value) ?? 0;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  bool validateForm() {
    if (_productName.isEmpty) {
      _errorMessage = 'Product name is required';
      notifyListeners();
      return false;
    }
    if (_price <= 0) {
      _errorMessage = 'Price must be greater than 0';
      notifyListeners();
      return false;
    }
    if (_selectedCategory.isEmpty) {
      _errorMessage = 'Please select a category';
      notifyListeners();
      return false;
    }
    if (_stockQuantity <= 0) {
      _errorMessage = 'Stock quantity must be greater than 0';
      notifyListeners();
      return false;
    }
    if (_description.isEmpty) {
      _errorMessage = 'Description is required';
      notifyListeners();
      return false;
    }
    _errorMessage = '';
    return true;
  }

  Future<void> addProduct() async {
    if (!validateForm()) {
      notifyListeners();
      return;
    }

    _isLoading = true;
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

      await Future.delayed(const Duration(seconds: 2));

      print('✅ Product Added:');
      print('ID: ${product.id}');
      print('Name: ${product.name}');
      print('Price: \$${product.price}');
      print('Category: ${product.category}');
      print('Stock: ${product.stockQuantity}');
      print('Description: ${product.description}');
      print('JSON: ${product.toJson()}');

      clearForm();
      _errorMessage = 'Product added successfully!';
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error adding product: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteProduct() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));

      print('❌ Product Deleted');
      clearForm();
      _errorMessage = 'Product deleted successfully!';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Error deleting product: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearForm() {
    _productName = '';
    _price = 0.0;
    _selectedCategory = '';
    _stockQuantity = 0;
    _description = '';
    _errorMessage = '';
    notifyListeners();
  }
}
