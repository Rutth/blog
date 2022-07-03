import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/login/main.dart';
import 'package:blog/shared/scale.transition.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () async {
      BlocProvider.of<ProfileBloc>(context).add(CheckLoggedEvent());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlogColors.yellowPastel,
      body: SafeArea(
          child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16.0),
              height: 200,
              child: const Image(
                  image: AssetImage(
                'assets/logo.png',
              ))),
          Container(
              padding: const EdgeInsets.all(16.0),
              height: 200,
              child: const Image(
                  image: AssetImage(
                'assets/ruth.png',
              ))),
          const Text(
            "Ruth Barros",
            style: TextStyle(fontSize: 12),
          ),
          const Text(
            "ruthbarrospinheiro@gmail.com",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          BlocConsumer<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return const SpinKitThreeBounce(
                color: blogBlue,
              );
            },
            listener: (context, state) {
              if (state is SuccessCheckUser) {
                BlocProvider.of<ProfileBloc>(context).add(LoginUserEvent(
                    cpf: state.userLogin.cpf,
                    password: state.userLogin.password));
                Navigator.pushReplacement(
                    context, ScaleRoute(page: const LoginScreen()));
              } else {
                Navigator.pushReplacement(
                    context, ScaleRoute(page: const LoginScreen()));
              }
            },
          )
        ],
      )),
    );
  }
}
