import 'package:nti_final_project/features/home/view/cubits/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote_data_source.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getProducts() async {
    emit(ProductsIsLoadingState());
    await remoteDataSource.getProducts().then(
          (value) {
        emit(ProductsSuccessState(products: value));
      },
      onError: (error) {
        emit(ProductsFailerState(messageError: error));
      },
    );
  }
}
