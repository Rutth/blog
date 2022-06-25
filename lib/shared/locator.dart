import 'package:blog/shared/http_client.dart';
import 'package:get_it/get_it.dart';

class Locator {
  static late GetIt _i;
  static GetIt get instance => _i;

  Locator.setup() {
    _i = GetIt.I;

    _i.registerSingleton<BlogHttp>(
      BlogHttp(defaultHeaders: {"Content-Type": "application/json"}),
    );
  }
}
