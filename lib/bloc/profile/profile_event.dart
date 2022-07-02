part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoginUser extends ProfileEvent {
  final String cpf;
  final String password;

  LoginUser({required this.cpf, required this.password});
}
