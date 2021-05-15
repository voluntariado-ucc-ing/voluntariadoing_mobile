import 'package:meta/meta.dart';

import 'package:voluntariadoing_mobile/authentication/repositories/authentication_repository.dart';
import 'package:voluntariadoing_mobile/common/providers/api_client.dart';
import 'package:voluntariadoing_mobile/config/constants.dart';

abstract class ApiProvider {
  ApiClient _client;

  AuthenticationRepository _authenticationRepository;

  String get endpoint;

  String get baseUri => '${Config.apiEndpoint}api/$endpoint/';

  ApiProvider({
    ApiClient apiClient,
    AuthenticationRepository authenticationRepository,
  })  : _client = apiClient ?? ApiClient(),
        _authenticationRepository =
            authenticationRepository ?? AuthenticationRepository();

  @protected
  Future<dynamic> post(
    String path, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    final requestHeaders = await withAuthorizationHeader(headers);

    final response = await _client.post(
      '$baseUri$path',
      body: body,
      headers: requestHeaders,
    );
    return response;
  }

  @protected
  Future<dynamic> put(
    String path, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    final requestHeaders = await withAuthorizationHeader(headers);

    final response = await _client.put(
      '$baseUri$path',
      body: body,
      headers: requestHeaders,
    );
    return response;
  }

  @protected
  Future<dynamic> patch(
    String path, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    final requestHeaders = await withAuthorizationHeader(headers);

    final response = await _client.patch(
      '$baseUri$path',
      body: body,
      headers: requestHeaders,
    );
    return response;
  }

  @protected
  Future<dynamic> get(
    String path, {
    Map<String, dynamic> filters,
    Map<String, String> headers,
  }) async {
    final requestHeaders = await withAuthorizationHeader(headers);
    final response = await _client.get(
      '$baseUri$path',
      filters: filters,
      headers: requestHeaders,
    );
    return response;
  }

  @protected
  Future<Map<String, String>> withAuthorizationHeader(
    Map<String, String> headers,
  ) async {
    final requestHeaders = <String, String>{};
    final authorization = await getAuthorizationHeader();
    requestHeaders.addAll(authorization);
    if (headers != null) {
      requestHeaders.addAll(headers);
    }
    return requestHeaders;
  }

  @protected
  Future<Map<String, String>> getAuthorizationHeader() async {
    final authenticationUser =
        await _authenticationRepository.getAuthenticationUser();
    final token = authenticationUser.credentials.token;
    return {'Authorization': 'Bearer $token'};
  }
}
