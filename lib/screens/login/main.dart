import 'package:blog/screens/login/form.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BlogColors.yellowPastel,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 220,
                  child: const Image(
                      image: AssetImage(
                    'assets/logo.png',
                  ))),
              const FormBody()
            ],
          ),
        ));
  }
}
