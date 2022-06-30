import 'package:blog/bloc/my_news/my_news_bloc.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AlertContentNews extends StatelessWidget {
  final VoidCallback onPressed;
  final bool editing;
  final Widget title;
  final TextEditingController controller;
  const AlertContentNews(
      {Key? key,
      required this.onPressed,
      required this.editing,
      required this.title,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: title,
        content: Form(
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
                    borderSide: BorderSide(color: BlogColors.gray, width: 1.0),
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
        actions: [_content(_formKey)]);
  }

  Widget _content(_formKey) {
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
                  if (_formKey.currentState!.validate()) {
                    onPressed();
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
