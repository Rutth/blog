import 'dart:convert';

import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/profile_entity.dart';
import 'package:blog/shared/http_client.dart';
import 'package:flutter/material.dart';

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
}
