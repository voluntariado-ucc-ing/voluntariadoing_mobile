import 'package:meta/meta.dart';

class ApiCredentials {
  final String token;

  final String refreshToken;

  final DateTime expiry;

  ApiCredentials({
    @required this.token,
    @required this.refreshToken,
    @required this.expiry,
  });

  bool get isExpired => expiry != null && DateTime.now().isAfter(expiry);

  ApiCredentials copyWith({
    String token,
    String refreshToken,
    DateTime expiry,
  }) {
    return ApiCredentials(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      expiry: expiry ?? this.expiry,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'refresh_token': refreshToken,
      'expiry': expiry?.millisecondsSinceEpoch,
    };
  }

  factory ApiCredentials.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiCredentials(
      token: map['token'],
      refreshToken: map['refresh_token'],
      expiry: DateTime.fromMillisecondsSinceEpoch(map['expiry']),
    );
  }

  @override
  String toString() =>
      'ApiCredentials(token: $token, refreshToken: $refreshToken, expiry: $expiry)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ApiCredentials &&
        o.token == token &&
        o.refreshToken == refreshToken &&
        o.expiry == expiry;
  }

  @override
  int get hashCode => token.hashCode ^ refreshToken.hashCode ^ expiry.hashCode;
}
