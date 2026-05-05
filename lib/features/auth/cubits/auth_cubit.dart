
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/auth/data/auth_remote_data_source.dart';
import 'package:nti_final_project/features/auth/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitialState());

  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
  Future<void> login({required String email, required String password}) async {
    emit(LoginInitialState());
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
}
