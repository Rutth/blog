import 'dart:convert';

import 'package:blog/entities/errors/exceptions.dart';
import 'package:blog/entities/news_entity.dart';
import 'package:blog/shared/http_client.dart';
import 'package:flutter/material.dart';

class NewsService {
  final BlogHttp http;
  NewsService(this.http);

  Future<List<News>> getNews() async {
    try {
      const String _url =
          'https://gb-mobile-app-teste.s3.amazonaws.com/data.json';

      final response = await http.get(
        Uri.parse(_url),
      );

      if (response.statusCode == 200) {
        final _data = jsonDecode(response.body)["news"];

        debugPrint("response $_data");

        final List<News> _collection =
            _data.map<News>((e) => News.fromJson(e)).toList();

        return _collection;
      } else {
        throw GeneralException("Ocorreu um erro! Tente novamente");
      }
    } catch (ex) {
      rethrow;
    }
  }
}
