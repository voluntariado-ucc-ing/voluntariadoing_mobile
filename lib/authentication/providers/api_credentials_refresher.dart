import 'dart:async';

import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/common/providers/api_client.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

class ApiCredentialsRefresher {
  static const _refreshUri = '${Config.apiEndpoint}api/auth/refresh_token/';

  ApiClient _client;

  ApiCredentialsRefresher({
    ApiClient apiClient,
  })  : _client = apiClient ?? ApiClient();

  Future<ApiCredentials> refresh(ApiCredentials credentials) async {
    final response = await _client.post(
      _refreshUri,
      body: {'refresh_token': credentials.refreshToken},
    );

    final newCredentials = ApiCredentials.fromMap(response);
    return newCredentials;
  }
}
