import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote_data_source.dart';
import 'product_state.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getProducts() async {
    emit(ProductsIsLoadingState());

    try {
      final products = await remoteDataSource.getProducts();
      emit(ProductsSuccessState(products: products));
    } catch (error) {
      emit(
        ProductsFailerState(
          messageError: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}