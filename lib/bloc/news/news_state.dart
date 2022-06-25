part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class SuccessLoadNewsState extends NewsState {
  final List<News> list;

  SuccessLoadNewsState({required this.list});
}

class LoadingNewsState extends NewsState {}

class ErrorLoadNewsState extends NewsState {
  final String message;

  ErrorLoadNewsState({required this.message});
}
