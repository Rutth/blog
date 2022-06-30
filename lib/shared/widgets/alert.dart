import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget content;
  final String textOnPressed;
  const CustomAlert(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.content,
      this.textOnPressed = "Ok"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        Center(
            child: ElevatedButton(
                onPressed: onPressed, child: Text(textOnPressed)))
      ],
    );
  }
}
