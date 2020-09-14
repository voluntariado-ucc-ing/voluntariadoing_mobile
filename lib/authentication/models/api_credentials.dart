import 'package:meta/meta.dart';

class ApiCredentials {
  String token;

  String refreshToken;

  DateTime expiry;

  bool get isExpired => expiry != null && DateTime.now().isAfter(expiry);

  ApiCredentials._();

  static final ApiCredentials _instance = ApiCredentials._();

  factory ApiCredentials(
      {@required String token,
      @required String refreshToken,
      @required DateTime expiry}) {
    _instance.token = token;
    _instance.refreshToken = refreshToken;
    _instance.expiry = expiry;
    return _instance;
  }
}
