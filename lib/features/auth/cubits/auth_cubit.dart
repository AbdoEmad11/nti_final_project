import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/storage/token_storage.dart';
import 'package:nti_final_project/features/auth/data/auth_remote_data_source.dart';
import 'package:nti_final_project/features/auth/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  String? _extractStringValue(Map<String, dynamic> response, List<String> keys) {
    for (final key in keys) {
      final value = response[key];
      if (value != null && value.toString().trim().isNotEmpty) {
        return value.toString();
      }
    }

    final data = response['data'];
    if (data is Map<String, dynamic>) {
      for (final key in keys) {
        final value = data[key];
        if (value != null && value.toString().trim().isNotEmpty) {
          return value.toString();
        }
      }
    }

    final result = response['result'];
    if (result is Map<String, dynamic>) {
      for (final key in keys) {
        final value = result[key];
        if (value != null && value.toString().trim().isNotEmpty) {
          return value.toString();
        }
      }
    }

    return null;
  }

  String? _extractToken(Map<String, dynamic> response) {
    return _extractStringValue(response, [
      'token',
      'accessToken',
      'jwtToken',
      'jwt',
      'bearerToken',
    ]);
  }

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

      final token = _extractToken(response);

      if (token == null || token.isEmpty) {
        emit(
          LoginFailureState(
            'Login success but token not found in response. Check API response.',
          ),
        );
        return;
      }

      await TokenStorage.saveToken(token);

      await TokenStorage.saveUserData(
        userEmail: email,
        userId: _extractStringValue(response, ['userId', 'id']),
        userName: _extractStringValue(response, [
          'name',
          'userName',
          'fullName',
          'firstName',
        ]),
        userPhoto: _extractStringValue(response, ['picture', 'photo', 'image']),
      );

      emit(
        LoginSuccessState(
          message: response['message']?.toString() ?? 'Login successful',
          token: token,
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
      final response = await authRemoteDataSource.forgotPassword(email: email);

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