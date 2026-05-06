

import '../../data/models/products_model.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsIsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<ProductModel> products;

  ProductsSuccessState({required this.products});
}

class ProductsFailerState extends ProductsStates {
  final String messageError;

  ProductsFailerState({required this.messageError});
}
