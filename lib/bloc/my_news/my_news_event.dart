part of 'my_news_bloc.dart';

@immutable
abstract class MyNewsEvent {}

class LoadMyNewsEvent extends MyNewsEvent {
  final String cpf;

  LoadMyNewsEvent({required this.cpf});
}

class AddNewsEvent extends MyNewsEvent {
  final String cpf;
  final String content;
  

  AddNewsEvent({required this.cpf, required this.content});
}

class EditNewsEvent extends MyNewsEvent {
  final String cpf;
  final String content;
  final int id;

  EditNewsEvent({required this.cpf, required this.content, required this.id});
}

class DeleteNewsEvent extends MyNewsEvent {
  final int id;

  DeleteNewsEvent({required this.id});
}
