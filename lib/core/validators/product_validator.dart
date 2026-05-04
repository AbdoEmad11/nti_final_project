class ProductValidator {
  // Validate product name
  static String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product name is required';
    }
    if (value.length < 3) {
      return 'Product name must be at least 3 characters';
    }
    if (value.length > 100) {
      return 'Product name cannot exceed 100 characters';
    }
    return null;
  }

  // Validate price
  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }
    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid price';
    }
    if (price <= 0) {
      return 'Price must be greater than 0';
    }
    if (price > 999999) {
      return 'Price is too high';
    }
    return null;
  }

  // Validate category
  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  // Validate stock quantity
  static String? validateStockQuantity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Stock quantity is required';
    }
    final quantity = int.tryParse(value);
    if (quantity == null) {
      return 'Please enter a valid quantity';
    }
    if (quantity < 0) {
      return 'Stock quantity cannot be negative';
    }
    if (quantity > 999999) {
      return 'Stock quantity is too high';
    }
    return null;
  }

  // Validate description
  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Description is required';
    }
    if (value.length < 10) {
      return 'Description must be at least 10 characters';
    }
    if (value.length > 1000) {
      return 'Description cannot exceed 1000 characters';
    }
    return null;
  }

  // Validate all fields
  static Map<String, String> validateAll({
    required String productName,
    required String price,
    required String category,
    required String stockQuantity,
    required String description,
  }) {
    final errors = <String, String>{};

    final nameError = validateProductName(productName);
    if (nameError != null) errors['name'] = nameError;

    final priceError = validatePrice(price);
    if (priceError != null) errors['price'] = priceError;

    final categoryError = validateCategory(category);
    if (categoryError != null) errors['category'] = categoryError;

    final quantityError = validateStockQuantity(stockQuantity);
    if (quantityError != null) errors['quantity'] = quantityError;

    final descriptionError = validateDescription(description);
    if (descriptionError != null) errors['description'] = descriptionError;

    return errors;
  }
}