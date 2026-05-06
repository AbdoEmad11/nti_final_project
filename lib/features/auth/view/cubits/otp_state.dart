abstract class OtpStates {}

class OtpInitialState extends OtpStates {}

class OtpIsLoadingState extends OtpStates {}

class OtpSuccessState extends OtpStates {}

class OtpFailureState extends OtpStates {
  final String message;

  OtpFailureState(this.message);
}