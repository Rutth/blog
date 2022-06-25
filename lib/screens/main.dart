import 'package:blog/screens/home/main.dart';
import 'package:blog/screens/list_blocs.dart';
import 'package:blog/shared/locator.dart';
import 'package:blog/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlogMain extends StatelessWidget {
  BlogMain({Key? key}) : super(key: key) {
    Locator.setup();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ListBlocs(
      child: MaterialApp(
        title: 'Blog',
        home: const HomeScreen(),
        navigatorObservers: [route],
      ),
    );
  }
}
