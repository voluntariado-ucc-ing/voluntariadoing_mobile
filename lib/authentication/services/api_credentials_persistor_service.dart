import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

class ApiCredentialsPersistorService {
  FutureOr<SharedPreferences> _preferences;

  ApiCredentialsPersistorService({SharedPreferences preferences})
      : _preferences = preferences ?? SharedPreferences.getInstance();

  Future<void> persist(ApiCredentials credentials) async {
    final credentialsMap = {
      'token': credentials.token,
      'refresh_token': credentials.refreshToken,
      'expiry': credentials.expiry.millisecondsSinceEpoch
    };

    (await _preferences).setString(
        credentialsSharedPreferencesKey, json.encode(credentialsMap));
  }
}
