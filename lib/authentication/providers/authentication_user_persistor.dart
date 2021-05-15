import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:voluntariadoing_mobile/authentication/models/authentication_user.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

class AuthenticationUserPersistor {
  FutureOr<SharedPreferences> _preferences;

  AuthenticationUserPersistor({SharedPreferences preferences})
      : _preferences = preferences ?? SharedPreferences.getInstance();

  Future<void> persist(AuthenticationUser authenticationUser) async {
    final authenticationUserMap = authenticationUser.toMap();
    (await _preferences).setString(
      Config.authenticationUserSharedPreferencesKey,
      json.encode(authenticationUserMap),
    );
  }
}
