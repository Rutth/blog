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
