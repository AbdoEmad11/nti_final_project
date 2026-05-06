import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/auth/data/data_source/remote_data_source.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit() : super(OtpInitialState());

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();

  Future<void> otpVerify({
    required String email,
    required String getOtp,
  }) async {
    emit(OtpIsLoadingState());

    try {
      await remoteDataSource.otpVerify(email: email, getOtp: getOtp);
      emit(OtpSuccessState());
      log("OTP Verify Success");
    } catch (error) {
      emit(OtpFailureState(error.toString()));
      log("OTP Verify Error: $error");
    }
  }
}