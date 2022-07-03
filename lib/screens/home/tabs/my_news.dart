import 'package:blog/bloc/my_news/my_news_bloc.dart';
import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/home/widgets/item_my_new.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyNewsTab extends StatefulWidget {
  const MyNewsTab({Key? key}) : super(key: key);

  @override
  State<MyNewsTab> createState() => _MyNewsTabState();
}

class _MyNewsTabState extends State<MyNewsTab> {
  @override
  void initState() {
    BlocProvider.of<MyNewsBloc>(context).add(
        LoadMyNewsEvent(cpf: BlocProvider.of<ProfileBloc>(context).perfil.cpf));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<MyNewsBloc, MyNewsState>(
        builder: (context, state) {
          if (state is LoadingMyNewsState) {
            return const SpinKitThreeBounce(
              color: blogBlue,
            );
          } else if (state is ErrorLoadMyNewsState) {
            return Text(state.message);
          } else if (state is SuccessLoadMyNewsState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final _item = state.list.elementAt(index);
                return ItemMyNews(news: _item);
              },
            );
          } else if (state is NoDataState) {
            return const Text(
              "Você não possui notícias postadas!",
              textAlign: TextAlign.center,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
