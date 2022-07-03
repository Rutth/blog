import 'package:bloc/bloc.dart';
import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/shared/locator.dart';
import 'package:blog/shared/services/my_news.dart';
import 'package:meta/meta.dart';

part 'my_news_event.dart';
part 'my_news_state.dart';

class MyNewsBloc extends Bloc<MyNewsEvent, MyNewsState> {
  MyNewsBloc() : super(MyNewsInitial()) {
    on<MyNewsEvent>((event, emit) async {
      if (event is LoadMyNewsEvent) {
        emit(LoadingMyNewsState());

        try {
          final _list = await Locator.instance
              .get<MyNewsService>()
              .getMyNews(cpf: event.cpf);

          emit(_list.isNotEmpty
              ? SuccessLoadMyNewsState(list: _list)
              : NoDataState());
        } on BlogException catch (ex) {
          emit(ErrorLoadMyNewsState(message: ex.message));
        }
      } else if (event is AddNewsEvent) {
        emit(LoadingSendNewsState());
        try {
          final _message = await Locator.instance
              .get<MyNewsService>()
              .addNew(cpf: event.cpf, content: event.content);

          emit(SuccessSendNewsState(message: _message));
        } on BlogException catch (ex) {
          emit(ErrorSendNewsState(message: ex.message));
        }
      } else if (event is EditNewsEvent) {
        emit(LoadingSendNewsState());
        try {
          final _message = await Locator.instance
              .get<MyNewsService>()
              .updateNews(id: event.id, content: event.content);

          emit(SuccessSendNewsState(message: _message));
        } on BlogException catch (ex) {
          emit(ErrorSendNewsState(message: ex.message));
        }
      } else if (event is DeleteNewsEvent) {
        emit(LoadingSendNewsState());
        try {
          final _message = await Locator.instance
              .get<MyNewsService>()
              .deleteNews(id: event.id);

          emit(SuccessSendNewsState(message: _message));
        } on BlogException catch (ex) {
          emit(ErrorSendNewsState(message: ex.message));
        }
      }
    });
  }
}
