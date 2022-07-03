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
