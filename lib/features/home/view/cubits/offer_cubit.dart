import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/remote_data_source.dart';
import 'offer_state.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit() : super(OffersInitialState());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getOffers() async {
    emit(OffersIsLoadingState());
    await remoteDataSource.getOffers().then(
      (value) {
        emit(OffersSuccessState(offers: value));
      },
      onError: (error) {
        emit(OffersFailerState(messageError: error));
      },
    );
  }
}
