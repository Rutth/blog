import 'package:blog/bloc/news/news_bloc.dart';
import 'package:blog/screens/home/widgets/item.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GbNewsTab extends StatefulWidget {
  const GbNewsTab({Key? key}) : super(key: key);

  @override
  State<GbNewsTab> createState() => _GbNewsTabState();
}

class _GbNewsTabState extends State<GbNewsTab> {
  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(LoadNewsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final _item = state.list.elementAt(index);
                return ItemNewsList(news: _item);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
