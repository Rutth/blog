import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonSignup extends StatelessWidget {
  final Function onPressed;
  const ButtonSignup({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is LoadingSignupUser) {
            return const SpinKitThreeBounce(color: blogBlue);
          } else {
            return Container(
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
                child: const Text("Confirmar"),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is ErrorSignupUser) {
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
          } else if (state is SuccessSignupUser) {
            showDialog(
                context: context,
                builder: (BuildContext context) => CustomAlert(
                      title: "Aviso",
                      content: Text(
                        state.message,
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        //TODO ajustar popuntil
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ));
          }
        },
      ),
    );
  }
}
