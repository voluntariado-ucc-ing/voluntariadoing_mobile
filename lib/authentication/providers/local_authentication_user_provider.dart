import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:voluntariadoing_mobile/authentication/models/authentication_user.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

class LocalAuthenticationUserProvider {
  FutureOr<SharedPreferences> _preferences;

  LocalAuthenticationUserProvider({SharedPreferences preferences})
      : _preferences = preferences ?? SharedPreferences.getInstance();

  FutureOr<AuthenticationUser> getAuthenticationUser() async {
    final prefsString = (await _preferences).getString(Config.authenticationUserSharedPreferencesKey);
   // print(prefsString);
    if (prefsString != null) {
      final prefsJson = json.decode(prefsString);
      final authenticationUser = AuthenticationUser.fromMap(prefsJson);
      return authenticationUser;
    }
    return null;
  }
}
