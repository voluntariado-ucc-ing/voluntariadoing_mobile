import 'package:meta/meta.dart';

class ApiException implements Exception {
  final String reason;
  final int statusCode;

  ApiException({@required this.reason, @required this.statusCode});
}