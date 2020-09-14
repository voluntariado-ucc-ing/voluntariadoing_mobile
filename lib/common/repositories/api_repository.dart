import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:voluntariadoing_mobile/authentication/services/api_credentials_refresher_service.dart';
import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';
import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

abstract class ApiRepository {
  ApiCredentialsRefresherService _refresher;

  http.BaseClient _client;

  ApiCredentials credentials;

  String get endpoint;

  String get baseUri => '${apiEndpoint}api/$endpoint/';

  Map<String, dynamic> get headers =>
      {'Authorization': 'Bearer ${credentials.token}'};

  ApiRepository(ApiCredentials credentials,
      [http.BaseClient httpClient, ApiCredentialsRefresherService refresher])
      : _client = httpClient ?? http.Client(),
        _refresher = refresher ?? ApiCredentialsRefresherService();

  @protected
  Future<Map<String, dynamic>> post(String path,
      {Map<String, String> body}) async {
    final url = '$baseUri$path';

    return requestWrapper(
        () async => await _client.post(url, body: body, headers: headers));
  }

  @protected
  Future<Map<String, dynamic>> get(String path,
      {Map<String, String> filters}) async {
    var url = '$baseUri$path';
    if (filters != null) {
      url += '?';
      final parsedFilters = List.generate(
              filters.length,
              (i) =>
                  '${filters.keys.toList()[i]}=${filters.values.toList()[i]}')
          .join('&');
      url += parsedFilters;
    }
    return requestWrapper(() async => await _client.get(url, headers: headers));
  }

  @protected
  Future<Map<String, dynamic>> requestWrapper(
      Future<http.Response> Function() request) async {
    if (credentials.isExpired) {
      await _refresher.refresh(credentials);
    }
    return handleErrors(await request());
  }

  @protected
  Map<String, dynamic> handleErrors(http.Response response) {
    final responseBody = utf8.decode(response.bodyBytes);
    final jsonMap = json.decode(responseBody);
    if (response.statusCode >= 400) {
      final reason =
          jsonMap['error'] != null ? jsonMap['error']['message'] : null;
      throw ApiException(reason: reason, statusCode: response.statusCode);
    }
    return jsonMap['body'];
  }
}
