import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/home/main.dart';
import 'package:blog/shared/scale.transition.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function onPressed;
  const ButtonLogin({Key? key, required this.onPressed, required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is LoadingLoginUser) {
        return const SpinKitThreeBounce(
          color: blogBlue,
        );
      } else {
        return Container(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(blogBlue[600]),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: blogBlue[600]!)))),
            onPressed: () {
              onPressed();
            },
            child: const Text("Entrar"),
          ),
        );
      }
    }, listener: (context, state) {
      if (state is ErrorLoginUser) {
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
                  },
                ));
      } else if (state is SuccessLoginUser) {
        Navigator.pushReplacement(
            context, ScaleRoute(page: const HomeScreen()));
      }
    });
  }
}
