import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/auth/data/data_source/remote_data_source.dart';
import 'auth_state.dart';

class ResetCubit extends Cubit<ResetPasswordState> {
  ResetCubit() : super(ResetPasswordInitial());

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();

  Future<void> reset({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoading());

    try {
      await remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      emit(ResetPasswordSuccess());
      log("Reset Password Success");
    } catch (error) {
      emit(ResetPasswordFailure(error.toString()));
      log("Reset Password Error: $error");
    }
  }
}