import 'package:blog/bloc/news/news_bloc.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(LoadNewsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notícias"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is LoadingNewsState) {
              return const SpinKitThreeBounce(
                color: blogBlue,
              );
            } else if (state is ErrorLoadNewsState) {
              return Text(state.message);
            } else if (state is SuccessLoadNewsState) {
              return const Text("ok");
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
