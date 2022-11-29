import 'package:markon_project/model/signup_model.dart';

class SignUpState {}

class IsSignUpState extends SignUpState {}

class NotSignUpState extends SignUpState {}

class InitState extends SignUpState {}

class SignUpInProgress extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponseHeader ? sii;

  SignUpSuccess({this.sii});
}

class SignUpFailed extends SignUpState {
  final String? error;

  SignUpFailed({this.error});
}
