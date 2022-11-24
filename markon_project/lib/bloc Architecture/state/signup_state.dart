class SignUpState {}

class IsSignUpState extends SignUpState {}

class NotSignUpState extends SignUpState {}

class InitState extends SignUpState {}

class SignUpInProgress extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String? succes;

  SignUpSuccess({this.succes});
}

class SignUpFailed extends SignUpState {
  final String? error;

  SignUpFailed({this.error});
}
