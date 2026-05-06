import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/remote_data_source.dart';
import 'offer_state.dart';

class OffersCubit extends Cubit<OffersStates> {
  OffersCubit() : super(OffersInitialState());

  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getOffers() async {
    emit(OffersIsLoadingState());

    try {
      final offers = await remoteDataSource.getOffers();
      emit(OffersSuccessState(offers: offers));
    } catch (error) {
      emit(
        OffersFailerState(
          messageError: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}