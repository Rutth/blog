import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/signup/widgets/button_signup.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/validators.dart';
import 'package:blog/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({Key? key}) : super(key: key);

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final MaskTextInputFormatter maskCpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: BlogColors.grayLight,
          border: Border.all(color: BlogColors.grayLight),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldCustom(
                      validators: (value) => Validators.requiredField(value),
                      icon: Icons.perm_contact_cal,
                      controller: nameController,
                      hintText: "Nome",
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldCustom(
                      icon: Icons.perm_contact_cal,
                      controller: emailController,
                      validators: (value) => Validators.email(value),
                      hintText: "E-mail",
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldCustom(
                      validators: (value) => Validators.cpf(value),
                      icon: Icons.perm_contact_cal,
                      controller: cpfController,
                      mask: maskCpfFormatter,
                      hintText: "CPF",
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldCustom(
                      validators: (value) => Validators.requiredField(value),
                      obscureText: true,
                      icon: Icons.perm_contact_cal,
                      controller: passwordController,
                      hintText: "Senha",
                    )),
                ButtonSignup(
                  onPressed: () {
                    _onPressed();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ProfileBloc>(context).add(SignupUserEvent(
          cpf: maskCpfFormatter.getUnmaskedText(),
          password: passwordController.text,
          name: nameController.text,
          email: emailController.text));
    }
  }
}
