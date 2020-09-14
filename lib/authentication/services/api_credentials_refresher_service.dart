import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/authentication/services/api_credentials_persistor_service.dart';
import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';

import 'package:voluntariadoing_mobile/config/constants.dart';

class ApiCredentialsRefresherService {
  static const _refreshUri = '${apiEndpoint}api/auth/refresh_token/';

  http.BaseClient _client;

  ApiCredentialsPersistorService _persistor;

  ApiCredentialsRefresherService(
      {SharedPreferences preferences,
      http.BaseClient httpClient,
      ApiCredentialsPersistorService presistor})
      : _client = httpClient ?? http.Client(),
        _persistor = presistor ??
            ApiCredentialsPersistorService(preferences: preferences);

  Future<void> refresh(ApiCredentials credentials) async {
    final response = await _client
        .post(_refreshUri, body: {'refresh_token': credentials.refreshToken});
    final responseBody = utf8.decode(response.bodyBytes);
    final jsonMap = json.decode(responseBody);

    if (response.statusCode >= 400) {
      final reason =
          jsonMap['error'] != null ? jsonMap['error']['message'] : null;
      throw ApiException(reason: reason, statusCode: response.statusCode);
    }

    final data = jsonMap['body'];

    credentials.token = data['token'];
    credentials.refreshToken = data['refresh_token'];
    credentials.expiry =
        DateTime.fromMillisecondsSinceEpoch(data['expiry'] * 1000);

    await _persistor.persist(credentials);
  }
}
