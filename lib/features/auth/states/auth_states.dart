abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginFailureState extends AuthStates {
  late final String failure;
  LoginFailureState(this.failure);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterFailureState extends AuthStates {}

class ForgotPasswordLoadingState extends AuthStates {}

class ForgotPasswordrSuccessState extends AuthStates {}

class ForgotPasswordFailureState extends AuthStates {}
