class LogoutState {}

class IsLogoutState extends LogoutState {}

class NotLogoutState extends LogoutState {}

class InitState extends LogoutState {}

class LogoutInProgress extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutFailed extends LogoutState {
  final String? error;

  LogoutFailed({this.error});
}
