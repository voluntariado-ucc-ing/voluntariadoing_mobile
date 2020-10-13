import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:voluntariadoing_mobile/authentication/models/authentication_user.dart';
import 'package:voluntariadoing_mobile/authentication/repositories/authentication_repository.dart';
import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _repository;

  AuthenticationCubit({
    AuthenticationRepository authenticationRepository,
  }) : _repository = authenticationRepository ?? AuthenticationRepository(),
        super(AuthenticationInitial());

  Future<void> getAuthenticationUser() async {
    final authenticationUser = await _repository.getAuthenticationUser();
    if (authenticationUser == null) {
      emit(AuthenticationNotFound());
    } else {
      emit(AuthenticationSuccess(authenticationUser));
    }
  }

  Future<void> authenticate(String username, String password) async {
    try {
      emit(AuthenticationLoading());
      final authenticationUser = await _repository.authenticate(username, password);
      emit(AuthenticationSuccess(authenticationUser));
    } on ApiException catch (error) {
      emit(AuthenticationFailure(error));
    }
  }

  void logout() => emit(AuthenticationInitial());
}
