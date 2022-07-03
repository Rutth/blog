import 'dart:convert';

import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/profile_entity.dart';
import 'package:blog/entities/user_login_entity.dart';
import 'package:blog/shared/constants.dart';
import 'package:blog/shared/http_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final BlogHttp http;
  UserService(this.http);

  Future<Profile> loginUser(
      {required String cpf, required String password}) async {
    try {
      const String _url = 'http://localhost:3000/users/login';

      final Map<String, dynamic> _body = {"cpf": cpf, "password": password};

      final response =
          await http.post(Uri.parse(_url), body: jsonEncode(_body));

      if (response.statusCode == 200) {
        final _data = jsonDecode(response.body);

        debugPrint("response $_data");

        setUser(cpf, password);

        return Profile.fromJson(_data);
      } else {
        debugPrint(response.body);
        final String _message = jsonDecode(response.body)["message"];
        throw ProfileException(_message);
      }
    } on ProfileException catch (ex) {
      throw ProfileException(ex.message);
    } catch (ex) {
      debugPrint('$ex');
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }

  Future<String> signupUser(
      {required String cpf,
      required String password,
      required String email,
      required String name}) async {
    try {
      const String _url = 'http://localhost:3000/users/add';

      final Map<String, dynamic> _body = {
        "cpf": cpf,
        "password": password,
        "email": email,
        "name": name
      };

      final response =
          await http.post(Uri.parse(_url), body: jsonEncode(_body));

      if (response.statusCode == 201 || response.statusCode == 200) {
        final _message = jsonDecode(response.body)["message"];

        debugPrint("response ${response.body}");

        return _message;
      } else {
        debugPrint(response.body);
        final String _message = jsonDecode(response.body)["message"];
        throw ProfileException(_message);
      }
    } on ProfileException catch (ex) {
      throw ProfileException(ex.message);
    } catch (ex) {
      debugPrint('$ex');
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }

  Future<void> setUser(String cpf, String password) async {
    //TODO encrypt
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.userLogged, cpf);
    prefs.setString(Constants.passwordLogged, password);
  }

  Future<UserLogin> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _cpf = prefs.getString(Constants.userLogged);
    final String? _password = prefs.getString(Constants.passwordLogged);

    if (_cpf != null && _password != null) {
      return UserLogin(cpf: _cpf, password: _password);
    } else {
      throw ProfileException("Não possui usuário logado");
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(Constants.userLogged);
      prefs.remove(Constants.passwordLogged);
    } catch (ex) {
      debugPrint('$ex');
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }
}
