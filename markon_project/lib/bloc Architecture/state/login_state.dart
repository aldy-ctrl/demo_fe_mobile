class LoginState {}

class IsLoginState extends LoginState {}

class NotLoginState extends LoginState {}

class InitState extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String? error;

  LoginFailed({this.error});
}
