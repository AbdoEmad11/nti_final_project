import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/data_source.dart/remote_data_source.dart';
import 'categroy_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      final categories = await remoteDataSource.getCategories();
      emit(CategorySuccess(categories));
    } catch (error) {
      emit(CategoryError(error.toString()));
    }
  }
}