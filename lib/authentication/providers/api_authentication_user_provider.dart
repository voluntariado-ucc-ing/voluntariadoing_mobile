import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:voluntariadoing_mobile/authentication/models/authentication_user.dart';
import 'package:voluntariadoing_mobile/common/providers/api_client.dart';

import 'package:voluntariadoing_mobile/config/constants.dart';

class ApiAuthenticationUserProvider {
  static const _authenticationUri = '${Config.apiEndpoint}api/auth/login/';

  ApiClient _client;

  ApiAuthenticationUserProvider({
    ApiClient apiClient,
  }) : _client = apiClient ?? ApiClient();

  Future<AuthenticationUser> getAuthenticationUser(
    String username,
    String password,
  ) async {
    final response = await _client.post(
      _authenticationUri,
      body: {'username': username, 'password': password},
    );
    stderr.writeln(response);
    final responseMap = {
      'volunteer_id': response['volunteer_id'],
      'username': response['username'],
      'already_logged_in': response['already_logged_in'],
      'credentials': {
        'token': response['token'],
        'refresh_token': response['refresh_token'],
        'expiry': response['expiry'],
      }
    };

    final authenticationUser = AuthenticationUser.fromMap(responseMap);
    return authenticationUser;
  }
}
