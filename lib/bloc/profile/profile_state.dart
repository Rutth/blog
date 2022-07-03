part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ErrorLoginUser extends ProfileState {
  final String message;

  ErrorLoginUser({required this.message});
}

class SuccessLoginUser extends ProfileState {
  final Profile profile;

  SuccessLoginUser({required this.profile});
}

class LoadingLoginUser extends ProfileState {}

class ErrorSignupUser extends ProfileState {
  final String message;

  ErrorSignupUser({required this.message});
}

class SuccessSignupUser extends ProfileState {
  final String message;

  SuccessSignupUser({required this.message});
}

class LoadingSignupUser extends ProfileState {}

class ErrorLogout extends ProfileState {
  final String message;

  ErrorLogout({required this.message});
}

class SuccessLogout extends ProfileState {}

class LoadingCheckUser extends ProfileState {}

class ErrorCheckUser extends ProfileState {
  final String message;

  ErrorCheckUser({required this.message});
}

class SuccessCheckUser extends ProfileState {
  final UserLogin userLogin;

  SuccessCheckUser({required this.userLogin});
}
