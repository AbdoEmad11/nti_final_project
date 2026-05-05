import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/auth/data/auth_remote_data_source.dart';
import 'package:nti_final_project/features/auth/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    await authRemoteDataSource
        .login(email: email, password: password)
        .then(
          (val) {
            emit(LoginSuccessState());
          },
          onError: (err) {
            emit(LoginFailureState(err.toString()));
          },
        );
  }

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoadingState());
    await authRemoteDataSource
        .register(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        )
        .then(
          (val) {
            emit(RegisterSuccessState());
          },
          onError: (err) {
            emit(RegisterFailureState());
          },
        );
  }

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoadingState());
    await authRemoteDataSource
        .forgotPassword(email: email)
        .then(
          (val) {
            emit(ForgotPasswordrSuccessState());
          },
          onError: (err) {
            emit(ForgotPasswordFailureState());
          },
        );
  }
}
