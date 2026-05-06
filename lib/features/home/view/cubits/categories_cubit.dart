import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote_data_source.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getCategories() async {
    emit(CategoriesIsLoadingState());

    try {
      final categories = await remoteDataSource.getCategories();
      emit(CategoriesSuccessState(categories: categories));
    } catch (error) {
      emit(
        CategoriesFailerState(
          messageError: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}