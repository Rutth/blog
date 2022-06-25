import 'dart:convert';
import 'dart:io';

import 'package:blog/entities/errors/exceptions.dart';
import 'package:http/http.dart' as http;

class BlogHttp extends http.BaseClient {
  final Map<String, String>? defaultHeaders;

  final Duration _defaultTimeout = const Duration(seconds: 30);

  BlogHttp({this.defaultHeaders});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.addAll(defaultHeaders!);

    final _http = http.Client();

    try {
      final response = await _http.send(request).timeout(_defaultTimeout);

      return response;
    } on HandshakeException {
      throw NoInternetException();
    } on SocketException {
      throw NoInternetException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    } finally {
      _http.close();
    }
  }

  @override
  Future<http.Response> get(url, {Map<String, String>? headers}) async {
    final _http = http.Client();

    try {
      final response = await _http
          .get(url, headers: defaultHeaders)
          .timeout(_defaultTimeout, onTimeout: () {
        throw TimeoutException();
      });

      return response;
    } on SocketException {
      throw NoInternetException();
    } on HandshakeException {
      throw NoInternetException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    } finally {
      _http.close();
    }
  }

  @override
  Future<http.Response> post(
    url, {
    Map<String, String>? headers,
    body,
    Encoding? encoding,
    bool logBody = true,
  }) async {
    if (logBody) encoding ??= Encoding.getByName('utf-8');
    final _http = http.Client();
    try {
      final response = await _http
          .post(
        url,
        body: body,
        headers: defaultHeaders,
        encoding: encoding,
      )
          .timeout(
        _defaultTimeout,
        onTimeout: () {
          throw TimeoutException();
        },
      );

      return response;
    } on SocketException {
      throw NoInternetException();
    } on HandshakeException {
      throw NoInternetException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    } finally {
      _http.close();
    }
  }

  @override
  Future<http.Response> put(url,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    encoding ??= Encoding.getByName('utf-8');

    final _http = http.Client();

    try {
      final response = await _http
          .put(
        url,
        body: body,
        headers: defaultHeaders,
        encoding: encoding,
      )
          .timeout(_defaultTimeout, onTimeout: () {
        throw TimeoutException();
      });
      return response;
    } on SocketException {
      throw NoInternetException();
    } on HandshakeException {
      throw NoInternetException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    } finally {
      _http.close();
    }
  }

  @override
  Future<http.Response> delete(url,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    final _http = http.Client();

    try {
      final response = await _http
          .delete(
        url,
        body: body,
        headers: defaultHeaders,
        encoding: encoding,
      )
          .timeout(_defaultTimeout, onTimeout: () {
        throw TimeoutException();
      });

      return response;
    } on SocketException {
      throw NoInternetException();
    } on HandshakeException {
      throw NoInternetException();
    } on Exception catch (ex) {
      throw GeneralException(ex.toString());
    } finally {
      _http.close();
    }
  }
}
