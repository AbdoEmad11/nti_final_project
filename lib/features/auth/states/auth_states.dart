abstract class AuthStates{}
class LoginInitialState extends AuthStates{}
class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class LoginFailureState extends AuthStates{
  late final String failure;
  LoginFailureState(this.failure);
}