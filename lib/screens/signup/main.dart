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
        backgroundColor: BlogColors.yellowPastel,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: BlogColors.grayDark),
          backgroundColor: BlogColors.yellowPastel,
          elevation: 0,
          title: const Text(
            "Cadastre-se",
            style: TextStyle(color: BlogColors.grayDark),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FormSignup()],
          ),
        ));
  }
}
