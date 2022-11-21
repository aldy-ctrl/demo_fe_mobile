

import 'package:markon_project/model/login_model.dart';

class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginReq body;
  final String url; 

  LoginSubmitted(this.body, this.url);
}

class CheckLogin extends LoginEvent {}
