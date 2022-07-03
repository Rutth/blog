import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlogColors.yellowPastel,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 220,
            child: const Image(
                image: AssetImage(
              'assets/logo.png',
            ))),
      ),
    );
  }
}
