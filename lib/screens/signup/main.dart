import 'package:blog/screens/signup/form_signup.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//        backgroundColor: Colors.transparent,
          backgroundColor: blogBlue[200],
          elevation: 0,
          title: const Text("Cadastre-se"),
        ),
        backgroundColor: blogBlue[200],
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FormSignup()],
          ),
        ));
  }
}
