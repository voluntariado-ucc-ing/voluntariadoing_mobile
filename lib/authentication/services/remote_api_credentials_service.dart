import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/authentication/services/api_credentials_persistor_service.dart';
import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';

import 'package:voluntariadoing_mobile/config/constants.dart';

class RemoteApiCredentialsService {
  static const _loginUri = '${apiEndpoint}api/auth/login/';

  http.BaseClient _client;

  ApiCredentialsPersistorService _persistor;

  RemoteApiCredentialsService(
      {http.BaseClient httpClient, ApiCredentialsPersistorService presistor})
      : _client = httpClient ?? http.Client(),
        _persistor = presistor ?? ApiCredentialsPersistorService();

  Future<ApiCredentials> login(String username, String password) async {
    final response = await _client
        .post(_loginUri, body: {'username': username, 'password': password});
    final responseBody = utf8.decode(response.bodyBytes);
    final jsonMap = json.decode(responseBody);

    if (response.statusCode >= 400) {
      final reason =
          jsonMap['error'] != null ? jsonMap['error']['message'] : null;
      throw ApiException(reason: reason, statusCode: response.statusCode);
    }

    final data = jsonMap['body'];

    final credentials = ApiCredentials(
        token: data['token'],
        refreshToken: data['refresh_token'],
        expiry: DateTime.fromMillisecondsSinceEpoch(data['expiry'] * 1000));

    await _persistor.persist(credentials);

    return credentials;
  }
}
