part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final AuthenticationUser authenticationUser;
  AuthenticationSuccess(this.authenticationUser);
}

class AuthenticationFailure extends AuthenticationState {
  final ApiException error;
  AuthenticationFailure(this.error);
}

class AuthenticationNotFound extends AuthenticationState {}
