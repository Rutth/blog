import 'package:bloc/bloc.dart';
import 'package:blog/entities/news_entity.dart';
import 'package:blog/shared/locator.dart';
import 'package:blog/shared/services/news.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is LoadNewsListEvent) {
        emit(LoadingNewsState());

        try {
          final _list = await Locator.instance.get<NewsService>().getNews();

          emit(SuccessLoadNewsState(list: _list));
        } catch (ex) {
          emit(ErrorLoadNewsState(message: '$ex'));
        }
      }
    });
  }
}
