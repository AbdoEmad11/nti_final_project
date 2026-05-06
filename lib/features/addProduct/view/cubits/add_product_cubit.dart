import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/storage/token_storage.dart';
import 'package:nti_final_project/features/addProduct/data/data_source/add_product_remote_data_source.dart';
import 'package:nti_final_project/features/addProduct/data/models/create_product_request.dart';
import 'package:nti_final_project/features/addProduct/view/cubits/add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(const AddProductState());

  final AddProductRemoteDataSource _remoteDataSource =
      AddProductRemoteDataSource();

  static const String _fallbackSellerId =
      'd051dbf3-f5d8-410d-0e50-08de06562562';
  static const String _fallbackCategoryId =
      'pruebacat5919';
  static const String _fallbackImageUrl =
      'https://images.unsplash.com/photo-1523275335684-37898b6baf30';

  void onNameChanged(String value) => emit(state.copyWith(name: value));
  void onArabicNameChanged(String value) =>
      emit(state.copyWith(arabicName: value));
  void onDescriptionChanged(String value) =>
      emit(state.copyWith(description: value));
  void onDescriptionArabicChanged(String value) =>
      emit(state.copyWith(descriptionArabic: value));
  void onColorChanged(String value) => emit(state.copyWith(color: value));
  void onPriceChanged(String value) => emit(state.copyWith(price: value));
  void onStockChanged(String value) => emit(state.copyWith(stock: value));

  Future<void> submit() async {
    final validationError = _validate();
    if (validationError != null) {
      emit(state.copyWith(errorMessage: validationError, isSuccess: false));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      final sellerId = await TokenStorage.getUserId();

      final request = CreateProductRequest(
        sellerId: (sellerId == null || sellerId.isEmpty)
            ? _fallbackSellerId
            : sellerId,
        name: state.name.trim(),
        description: state.description.trim(),
        arabicName: state.arabicName.trim(),
        arabicDescription: state.descriptionArabic.trim(),
        coverPictureUrl: _fallbackImageUrl,
        price: num.parse(state.price.trim()),
        stock: int.parse(state.stock.trim()),
        weight: 1,
        color: state.color.trim(),
        discountPercentage: 0,
        categories: const [_fallbackCategoryId],
        productPictures: null,
      );

      final response = await _remoteDataSource.addProduct(request);
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          successMessage: response['message']?.toString() ?? 'Product added successfully',
          errorMessage: null,
        ),
      );
      _clearFields();
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  String? _validate() {
    if (state.name.trim().isEmpty) return 'Name is required';
    if (state.arabicName.trim().isEmpty) return 'Arabic name is required';
    if (state.description.trim().isEmpty) return 'Description is required';
    if (state.descriptionArabic.trim().isEmpty) {
      return 'Arabic description is required';
    }
    if (state.color.trim().isEmpty) return 'Color is required';

    final price = num.tryParse(state.price.trim());
    if (price == null || price <= 0) return 'Price must be greater than 0';

    final stock = int.tryParse(state.stock.trim());
    if (stock == null || stock <= 0) return 'Stock must be greater than 0';

    return null;
  }

  void _clearFields() {
    emit(
      state.copyWith(
        name: '',
        arabicName: '',
        description: '',
        descriptionArabic: '',
        color: '',
        price: '',
        stock: '',
      ),
    );
  }
}
