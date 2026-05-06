import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/auth/data/auth_remote_data_source.dart';
import 'package:nti_final_project/features/auth/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final response = await authRemoteDataSource.login(
        email: email,
        password: password,
      );

      emit(
        LoginSuccessState(
          message: response['message']?.toString() ?? 'Login successful',
        ),
      );
    } catch (error) {
      emit(
        LoginFailureState(
          error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoadingState());

    try {
      final response = await authRemoteDataSource.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      emit(
        RegisterSuccessState(
          email: email,
          message: response['message']?.toString() ?? 'Register successful',
        ),
      );
    } catch (error) {
      emit(
        RegisterFailureState(
          error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(ForgotPasswordLoadingState());

    try {
      final response = await authRemoteDataSource.forgotPassword(
        email: email,
      );

      emit(
        ForgotPasswordSuccessState(
          email: email,
          message: response['message']?.toString() ?? 'Code sent successfully',
        ),
      );
    } catch (error) {
      emit(
        ForgotPasswordFailureState(
          error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}