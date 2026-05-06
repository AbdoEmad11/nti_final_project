abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

// Login
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String? message;

  LoginSuccessState({this.message});
}

class LoginFailureState extends AuthStates {
  final String message;

  LoginFailureState(this.message);
}

// Register
class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final String email;
  final String? message;

  RegisterSuccessState({
    required this.email,
    this.message,
  });
}

class RegisterFailureState extends AuthStates {
  final String message;

  RegisterFailureState(this.message);
}

// Forgot Password
class ForgotPasswordLoadingState extends AuthStates {}

class ForgotPasswordSuccessState extends AuthStates {
  final String email;
  final String? message;

  ForgotPasswordSuccessState({
    required this.email,
    this.message,
  });
}

class ForgotPasswordFailureState extends AuthStates {
  final String message;

  ForgotPasswordFailureState(this.message);
}