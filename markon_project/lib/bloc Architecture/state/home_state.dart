

import 'package:markon_project/model/login_model.dart';

class HomeState {}

class InitialHomeState extends HomeState {}

class GetProfileLoading extends HomeState {}

class ProfileLoaded extends HomeState {
  final Login login;

  ProfileLoaded(this.login);
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}

class LogoutLoading extends HomeState {}

class HomeLogout extends HomeState {}
