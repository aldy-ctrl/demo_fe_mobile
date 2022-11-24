import 'package:markon_project/model/signup_model.dart';

class SignUpEvent {}

class SignSubmitted extends SignUpEvent {
  final SignUpRequest body;
  final String url;

  SignSubmitted(this.body, this.url);
}
