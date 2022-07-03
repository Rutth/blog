part of 'my_news_bloc.dart';

@immutable
abstract class MyNewsState {}

class MyNewsInitial extends MyNewsState {}

class SuccessLoadMyNewsState extends MyNewsState {
  final List<MyNews> list;

  SuccessLoadMyNewsState({required this.list});
}

class LoadingMyNewsState extends MyNewsState {}

class ErrorLoadMyNewsState extends MyNewsState {
  final String message;

  ErrorLoadMyNewsState({required this.message});
}

class SuccessSendNewsState extends MyNewsState {
  final String message;

  SuccessSendNewsState({required this.message});
}

class ErrorSendNewsState extends MyNewsState {
  final String message;

  ErrorSendNewsState({required this.message});
}

class LoadingSendNewsState extends MyNewsState {}

class NoDataState extends MyNewsState {}
