import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/data_source.dart/remote_data_source.dart';
import '../../data/models/category_model.dart';
import 'categroy_state.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
    RemoteDataSource remoteDataSource = RemoteDataSource();
  Future<void> getCategories() async {
    emit(CategoryLoading());
   await remoteDataSource.getCategories().then((categories) {
      emit(CategorySuccess(categories));
    }).catchError((error) {
      emit(CategoryError(error.toString()));
    });
  }
}