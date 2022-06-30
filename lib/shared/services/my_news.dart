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
      const String _url = 'http://localhost:3000/blogs/list';

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

  Future<String> addNew({required String cpf, required String content}) async {
    try {
      const String _url = 'http://localhost:3000/blogs/add';

      final _body = {"cpf": cpf, "content": content};

      final response =
          await http.post(Uri.parse(_url), body: jsonEncode(_body));

      if (response.statusCode == 200) {
        final _msg = jsonDecode(utf8.decode(response.bodyBytes))["message"];

        debugPrint("response ${response.body}");

        return _msg;
      } else {
        final _message = jsonDecode(response.body)["message"];
        throw GeneralException(_message);
      }
    } catch (ex) {
      debugPrint('$ex');
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }

  Future<String> updateNews({required int id, required String content}) async {
    try {
      const String _url = 'http://localhost:3000/blogs/update';

      final _body = {"id": id, "content": content};

      final response = await http.put(Uri.parse(_url), body: jsonEncode(_body));

      if (response.statusCode == 200) {
        final _msg = jsonDecode(utf8.decode(response.bodyBytes))["message"];

        debugPrint("response ${response.body}");

        return _msg;
      } else {
        final _message = jsonDecode(response.body)["message"];
        throw GeneralException(_message);
      }
    } catch (ex) {
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }

  Future<String> deleteNews({required int id}) async {
    try {
      const String _url = 'http://localhost:3000/blogs/delete';

      final _body = {"id": id};

      final response =
          await http.delete(Uri.parse(_url), body: jsonEncode(_body));

      if (response.statusCode == 200) {
        final _msg = jsonDecode(utf8.decode(response.bodyBytes))["message"];

        debugPrint("response ${response.body}");

        return _msg;
      } else {
        final _message = jsonDecode(response.body)["message"];
        throw GeneralException(_message);
      }
    } catch (ex) {
      throw GeneralException("Ocorreu um erro! Tente novamente");
    }
  }
}
