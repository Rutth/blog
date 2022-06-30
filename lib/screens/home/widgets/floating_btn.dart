import 'package:blog/bloc/my_news/my_news_bloc.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingBtn extends StatefulWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  State<FloatingBtn> createState() => _FloatingBtnState();
}

class _FloatingBtnState extends State<FloatingBtn> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _onPressedFloatingBtn();
      },
      backgroundColor: blogBlue,
      child: const Icon(Icons.add),
    );
  }

  void _onPressedFloatingBtn() {
    //TODO mudar cpf para cpf logado
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertContentNews(
            onPressed: () {
              BlocProvider.of<MyNewsBloc>(context).add(
                  AddNewsEvent(cpf: "07043125308", content: controller.text));
            },
            editing: false,
            title: const Text("Adicione uma nova notícia"),
            controller: controller)).then((value) => controller.clear());
  }
}
