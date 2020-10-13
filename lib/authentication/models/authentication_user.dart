import 'package:voluntariadoing_mobile/authentication/models/api_credentials.dart';

class AuthenticationUser {
  final int volunteerId;

  final String username;

  final bool alreadyLoggedIn;

  ApiCredentials _credentials;

  AuthenticationUser({
    this.volunteerId,
    this.username,
    this.alreadyLoggedIn,
    ApiCredentials credentials,
  }) : _credentials = credentials;

  bool get hasExpiredCredentials => _credentials.isExpired;

  ApiCredentials get credentials => _credentials;

  void updateCredentials(ApiCredentials newCredentials) {
    _credentials = newCredentials;
  }

  AuthenticationUser copyWith({
    int volunteerId,
    String username,
    bool alreadyLoggedIn,
    ApiCredentials credentials,
  }) {
    return AuthenticationUser(
      volunteerId: volunteerId ?? this.volunteerId,
      username: username ?? this.username,
      alreadyLoggedIn: alreadyLoggedIn ?? this.alreadyLoggedIn,
      credentials: credentials ?? this.credentials,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'volunteer_id': volunteerId,
      'username': username,
      'already_logged_in': alreadyLoggedIn,
      'credentials': credentials?.toMap(),
    };
  }

  factory AuthenticationUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthenticationUser(
      volunteerId: map['volunteer_id'],
      username: map['username'],
      alreadyLoggedIn: map['already_logged_in'],
      credentials: ApiCredentials.fromMap(map['credentials']),
    );
  }

  @override
  String toString() {
    return 'AuthenticationUser(volunteerId: $volunteerId, username: $username, '
        'alreadyLoggedIn: $alreadyLoggedIn, credentials: $credentials)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthenticationUser &&
        o.volunteerId == volunteerId &&
        o.username == username &&
        o.alreadyLoggedIn == alreadyLoggedIn &&
        o.credentials == credentials;
  }

  @override
  int get hashCode {
    return volunteerId.hashCode ^
        username.hashCode ^
        alreadyLoggedIn.hashCode ^
        credentials.hashCode;
  }
}
