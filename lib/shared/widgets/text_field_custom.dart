import 'package:blog/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final MaskTextInputFormatter? mask;
  final String? hintText;
  final IconData icon;
  final bool? obscureText;

  const TextFieldCustom(
      {Key? key,
      required this.controller,
      this.mask,
      this.hintText,
      this.obscureText = false,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.black,
            ),
      ),
      child: TextFormField(
        cursorColor: BlogColors.grayDark,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: BlogColors.grayDark, fontSize: 14),
        controller: controller,
        inputFormatters: mask != null ? [mask!] : null,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
        obscureText: obscureText!,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            size: 20,
            color: BlogColors.gray,
          ),
          contentPadding:
              const EdgeInsets.only(left: 20.0, bottom: 8.0, top: 8.0),
          filled: true,
          fillColor: BlogColors.grayLight4,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: BlogColors.grayLight4),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: BlogColors.grayLight4),
              borderRadius: BorderRadius.circular(30)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: BlogColors.grayLight4),
              borderRadius: BorderRadius.circular(30)),
          hintText: hintText,
        ),
      ),
    );
  }
}
