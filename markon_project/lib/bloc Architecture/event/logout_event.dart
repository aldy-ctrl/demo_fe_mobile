

import 'package:markon_project/model/login_model.dart';

class LogoutEvent {}

class LogoutSubmitted extends LogoutEvent {
 
  final Login body;
  LogoutSubmitted(this.body);
}

class CheckLogout extends LogoutEvent {}
