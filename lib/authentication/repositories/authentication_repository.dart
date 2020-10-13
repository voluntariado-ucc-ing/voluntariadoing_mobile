import 'package:voluntariadoing_mobile/authentication/models/authentication_user.dart';
import 'package:voluntariadoing_mobile/authentication/providers/api_authentication_user_provider.dart';
import 'package:voluntariadoing_mobile/authentication/providers/api_credentials_refresher.dart';
import 'package:voluntariadoing_mobile/authentication/providers/authentication_user_persistor.dart';
import 'package:voluntariadoing_mobile/authentication/providers/local_authentication_user_provider.dart';

class AuthenticationRepository {
  LocalAuthenticationUserProvider _localProvider;

  ApiAuthenticationUserProvider _apiProvider;

  AuthenticationUserPersistor _persistor;

  ApiCredentialsRefresher _refresher;

  AuthenticationRepository({
    LocalAuthenticationUserProvider localProvider,
    ApiAuthenticationUserProvider apiProvider,
    AuthenticationUserPersistor persistor,
    ApiCredentialsRefresher refresher,
  })  : _localProvider = localProvider ?? LocalAuthenticationUserProvider(),
        _apiProvider = apiProvider ?? ApiAuthenticationUserProvider(),
        _persistor = persistor ?? AuthenticationUserPersistor(),
        _refresher = refresher ?? ApiCredentialsRefresher();

  Future<AuthenticationUser> authenticate(
    String username,
    String password,
  ) async {
    final authenticationUser = await _apiProvider.getAuthenticationUser(
      username,
      password,
    );
    await _persistor.persist(authenticationUser);
    return authenticationUser;
  }

  Future<AuthenticationUser> getAuthenticationUser() async {
    final authenticationUser = await _localProvider.getAuthenticationUser();
    if (authenticationUser == null) return null;

    if (authenticationUser.hasExpiredCredentials) {
      final newCredentials = await _refresher.refresh(
        authenticationUser.credentials,
      );
      authenticationUser.updateCredentials(newCredentials);
      await _persistor.persist(authenticationUser);
    }
    return authenticationUser;
  }
}
