import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote_data_source.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getCategories() async {
    emit(CategoriesIsLoadingState());
    await remoteDataSource.getCategories().then(
      (value) {
        emit(CategoriesSuccessState(categories: value));
      },
      onError: (error) {
        emit(CategoriesFailerState(messageError: error));
      },
    );
  }
}
