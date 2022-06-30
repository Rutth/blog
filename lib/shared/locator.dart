import 'package:blog/shared/http_client.dart';
import 'package:blog/shared/services/my_news.dart';
import 'package:blog/shared/services/news.dart';
import 'package:get_it/get_it.dart';

class Locator {
  static late GetIt _i;
  static GetIt get instance => _i;

  Locator.setup() {
    _i = GetIt.I;

    _i.registerSingleton<BlogHttp>(
      BlogHttp(defaultHeaders: {"Content-Type": "application/json"}),
    );

    _i.registerLazySingleton<NewsService>(
        () => NewsService(_i.get<BlogHttp>()));

    _i.registerLazySingleton<MyNewsService>(
        () => MyNewsService(_i.get<BlogHttp>()));
  }
}
