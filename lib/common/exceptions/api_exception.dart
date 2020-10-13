import 'package:meta/meta.dart';

class ApiException implements Exception {
  final String title;
  final String reason;
  final int statusCode;

  ApiException({
    @required this.title,
    @required this.reason,
    @required this.statusCode,
  });

  @override
  String toString() => 'ApiException(title: $title, reason: $reason, statusCode: $statusCode)';
}
