import 'package:blog/bloc/profile/profile_bloc.dart';
import 'package:blog/screens/login/widgets/button_login.dart';
import 'package:blog/shared/styles/colors.dart';
import 'package:blog/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormBody extends StatefulWidget {
  const FormBody({Key? key}) : super(key: key);

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final MaskTextInputFormatter maskCpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _form();
  }

  Widget _form() {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: BlogColors.grayLight,
            border: Border.all(color: BlogColors.grayLight),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                  child: Text(
                    "Entre",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldCustom(
                      icon: Icons.perm_contact_cal,
                      controller: cpfController,
                      mask: maskCpfFormatter,
                      hintText: "CPF",
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldCustom(
                    icon: Icons.lock,
                    hintText: "Senha",
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                _buttons()
              ],
            )),
      ),
    );
  }

  Widget _buttons() {
    return Column(
      children: [
        ButtonLogin(
          onPressed: _onPressedLogin,
          formKey: _formKey,
        ),
        TextButton(onPressed: () {}, child: const Text("Cadastre-se"))
      ],
    );
  }

  void _onPressedLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ProfileBloc>(context).add(LoginUser(
          cpf: maskCpfFormatter.getUnmaskedText(),
          password: passwordController.text));
    }
  }
}
