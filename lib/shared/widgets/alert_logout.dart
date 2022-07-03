import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/login/main.dart';
import 'package:blog/shared/scale.transition.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertLogout extends StatelessWidget {
  const AlertLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Aviso"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [Text("Você deseja mesmo sair?")],
      ),
      actions: [_actions()],
    );
  }

  Widget _actions() {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ErrorLogout) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => CustomAlert(
                    title: "Aviso",
                    content: Text(state.message),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ));
        } else if (state is SuccessLogout) {
          Navigator.pushReplacement(
              context, ScaleRoute(page: const LoginScreen()));
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: blogBlue),
                onPressed: () {
                  BlocProvider.of<ProfileBloc>(context).add(LogoutEvent());
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
      },
    );
  }
}
