part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoginUser extends ProfileEvent {
  final String cpf;
  final String password;

  LoginUser({required this.cpf, required this.password});
}

class SignupUser extends ProfileEvent {
  final String cpf;
  final String name;
  final String email;
  final String password;

  SignupUser(
      {required this.cpf,
      required this.password,
      required this.name,
      required this.email});
}
