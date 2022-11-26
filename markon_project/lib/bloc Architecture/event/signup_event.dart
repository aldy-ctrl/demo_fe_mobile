import 'package:markon_project/model/signup_model.dart';

class SignUpEvent {}

class SignSubmitted extends SignUpEvent {
  final SignUpRequest body;

  SignSubmitted(this.body);
}
