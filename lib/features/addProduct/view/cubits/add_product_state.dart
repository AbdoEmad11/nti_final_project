class AddProductState {
  final bool isLoading;
  final bool isSuccess;
  final String? successMessage;
  final String? errorMessage;

  final String name;
  final String arabicName;
  final String description;
  final String descriptionArabic;
  final String color;
  final String price;
  final String stock;

  const AddProductState({
    this.isLoading = false,
    this.isSuccess = false,
    this.successMessage,
    this.errorMessage,
    this.name = '',
    this.arabicName = '',
    this.description = '',
    this.descriptionArabic = '',
    this.color = '',
    this.price = '',
    this.stock = '',
  });

  AddProductState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? successMessage,
    String? errorMessage,
    String? name,
    String? arabicName,
    String? description,
    String? descriptionArabic,
    String? color,
    String? price,
    String? stock,
  }) {
    return AddProductState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      successMessage: successMessage,
      errorMessage: errorMessage,
      name: name ?? this.name,
      arabicName: arabicName ?? this.arabicName,
      description: description ?? this.description,
      descriptionArabic: descriptionArabic ?? this.descriptionArabic,
      color: color ?? this.color,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }
}
