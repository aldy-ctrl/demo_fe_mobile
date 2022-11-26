

import 'package:markon_project/model/login_model.dart';

class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginReq body;
  

  LoginSubmitted(this.body);
}

class CheckLogin extends LoginEvent {}
