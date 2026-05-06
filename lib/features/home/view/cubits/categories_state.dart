
import '../../data/models/categories_model.dart';

abstract class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesIsLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  final List<CategoryModel> categories;

  CategoriesSuccessState({required this.categories});
}

class CategoriesFailerState extends CategoriesStates {
  final String messageError;

  CategoriesFailerState({required this.messageError});
}
