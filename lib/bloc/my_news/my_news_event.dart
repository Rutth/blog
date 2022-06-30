part of 'my_news_bloc.dart';

@immutable
abstract class MyNewsEvent {}

class LoadMyNewsEvent extends MyNewsEvent {
  final String cpf;

  LoadMyNewsEvent({required this.cpf});
}
