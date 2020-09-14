import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';
import 'package:voluntariadoing_mobile/authentication/services/api_credentials_refresher_service.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

class LocalApiCredentialsService {
  ApiCredentialsRefresherService _refresher;
  FutureOr<SharedPreferences> _preferences;

  LocalApiCredentialsService({SharedPreferences preferences})
      : _preferences = preferences ?? SharedPreferences.getInstance(),
        _refresher = ApiCredentialsRefresherService(preferences: preferences);

  FutureOr<ApiCredentials> getCredentials() async {
    final prefsString =
        (await _preferences).getString(credentialsSharedPreferencesKey);
    if (prefsString != null) {
      final prefsJson = json.decode(prefsString);
      final credentials = ApiCredentials(
          token: prefsJson['json'],
          refreshToken: prefsJson['refresh_token'],
          expiry: DateTime.fromMillisecondsSinceEpoch(prefsJson['expiry']));
      if (credentials.isExpired) {
        await _refresher.refresh(credentials);
      }
      return credentials;
    }
    return null;
  }
}
