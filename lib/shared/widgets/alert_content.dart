import 'package:blog/bloc/my_news/my_news_bloc.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AlertContentNews extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget title;
  final TextEditingController? controller;
  final bool deleting;
  final _formKey = GlobalKey<FormState>();
  AlertContentNews(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.controller,
      required this.deleting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: title,
        content: _body(),
        actions: [_content()]);
  }

  Widget _body() {
    return deleting
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Você deseja excluir este item?"),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: BlogColors.gray,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: BlogColors.gray, width: 1.0),
                      ),
                      hintText: 'Insira seu conteúdo aqui',
                    ),
                    keyboardType: TextInputType.multiline,
                    controller: controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira um texto';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          );
  }

  Widget _content() {
    return BlocConsumer<MyNewsBloc, MyNewsState>(listener: (context, state) {
      if (state is SuccessSendNewsState) {
        Navigator.pop(context);
        //TODO cpf usuario logado
        showDialog(
            context: context,
            builder: (BuildContext context) => CustomAlert(
                  title: "Aviso",
                  content: Text(
                    state.message,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    BlocProvider.of<MyNewsBloc>(context)
                        .add(LoadMyNewsEvent(cpf: "07043125308"));
                  },
                ));
      } else if (state is ErrorSendNewsState) {
        //TODO cpf usuario logado
        showDialog(
            context: context,
            builder: (BuildContext context) => CustomAlert(
                  title: "Aviso",
                  content: Text(
                    state.message,
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    BlocProvider.of<MyNewsBloc>(context)
                        .add(LoadMyNewsEvent(cpf: "07043125308"));
                  },
                ));
      }
    }, builder: (context, state) {
      if (state is LoadingSendNewsState) {
        return const SpinKitThreeBounce(color: blogBlue);
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: blogBlue),
                onPressed: () {
                  if (deleting) {
                    onPressed();
                  } else {
                    if (_formKey.currentState!.validate()) {
                      onPressed();
                    }
                  }
                },
                child: const Text("Confirmar")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: BlogColors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancelar")),
          ],
        );
      }
    });
  }
}
