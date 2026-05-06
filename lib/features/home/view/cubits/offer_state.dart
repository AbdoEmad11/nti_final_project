
import '../../data/models/offers_model.dart';

abstract class OffersStates {}

class OffersInitialState extends OffersStates {}

class OffersIsLoadingState extends OffersStates {}

class OffersSuccessState extends OffersStates {
  final List<OfferModel> offers;

  OffersSuccessState({required this.offers});
}

class OffersFailerState extends OffersStates {
  final String messageError;

  OffersFailerState({required this.messageError});
}
