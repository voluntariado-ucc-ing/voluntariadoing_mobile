import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' show BaseClient, Client, Response;

import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';

class ApiClient {
  BaseClient _client;

  ApiClient([BaseClient httpClient]) : _client = httpClient ?? Client();

  Future<dynamic> post(
    String uri, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    return requestWrapper(
        () async => await _client.post(uri, body: body, headers: headers));
  }

  Future<dynamic> put(
    String uri, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    return requestWrapper(
        () async => await _client.put(uri, body: body, headers: headers));
  }

  Future<dynamic> patch(
    String uri, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    return requestWrapper(
        () async => await _client.patch(uri, body: body, headers: headers));
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic> filters,
    Map<String, String> headers,
  }) async {
    if (filters != null) {
      uri += '?';
      final parsedFilters = List.generate(
              filters.length,
              (i) =>
                  '${filters.keys.toList()[i]}=${filters.values.toList()[i]}')
          .join('&');
      uri += parsedFilters;
    }
    return requestWrapper(() async => await _client.get(uri, headers: headers));
  }

  @protected
  Future<dynamic> requestWrapper(
      Future<Response> Function() request) async {
    return handleErrors(await request());
  }

  @protected
  dynamic handleErrors(Response response) {
    final responseBody = utf8.decode(response.bodyBytes);
    final jsonMap = json.decode(responseBody);
    if (response.statusCode >= 400) {
      final error = jsonMap['error'];
      final title = error != null ? error['message'] : null;
      final reason = error != null ? error['description'] : null;
      throw ApiException(
        title: title,
        reason: reason,
        statusCode: response.statusCode,
      );
    }
    return jsonMap['body'];
  }
}
