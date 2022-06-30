import 'dart:convert';

import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/my_news_entity.dart';
import 'package:blog/shared/http_client.dart';
import 'package:flutter/material.dart';

class MyNewsService {
  final BlogHttp http;
  MyNewsService(this.http);

  Future<List<MyNews>> getMyNews({required String cpf}) async {
    try {
      const String _url = 'http://localhost:3000/blogs/news';

      final _body = {"cpf": cpf};

      final response =
          await http.post(Uri.parse(_url), body: jsonEncode(_body));

      if (response.statusCode == 200) {
        final _data = jsonDecode(utf8.decode(response.bodyBytes))["data"];

        debugPrint("response $_data");

        final List<MyNews> _collection =
            _data.map<MyNews>((e) => MyNews.fromJson(e)).toList();

        return _collection;
      } else {
        final _message = jsonDecode(response.body)["message"];
        throw GeneralException(_message);
      }
    } catch (ex) {
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }
}
