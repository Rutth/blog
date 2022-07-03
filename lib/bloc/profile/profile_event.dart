part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoginUserEvent extends ProfileEvent {
  final String cpf;
  final String password;

  LoginUserEvent({required this.cpf, required this.password});
}

class SignupUserEvent extends ProfileEvent {
  final String cpf;
  final String name;
  final String email;
  final String password;

  SignupUserEvent(
      {required this.cpf,
      required this.password,
      required this.name,
      required this.email});
}

class LogoutEvent extends ProfileEvent {}

class CheckLoggedEvent extends ProfileEvent {}
