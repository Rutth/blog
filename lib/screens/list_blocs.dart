import 'package:blog/bloc/my_news/my_news_bloc.dart';
import 'package:blog/bloc/news/news_bloc.dart';
import 'package:blog/bloc/profile/profile_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBlocs extends StatelessWidget {
  final Widget child;

  const ListBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(create: (context) => NewsBloc()),
        BlocProvider<MyNewsBloc>(create: (context) => MyNewsBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
      ],
      child: child,
    );
  }
}
