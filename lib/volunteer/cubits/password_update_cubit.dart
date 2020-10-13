import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';
import 'package:voluntariadoing_mobile/volunteer/repositories/volunteer_repository.dart';

part 'password_update_state.dart';

class PasswordUpdateCubit extends Cubit<PasswordUpdateState> {
  VolunteerRepository _repository;

  PasswordUpdateCubit({VolunteerRepository repository})
      : _repository = repository ?? VolunteerRepository(),
        super(PasswordUpdateInitial());

  Future<void> updatePassword(
    String username,
    String currentPassword,
    String newPassword,
  ) async {
    try {
      emit(PasswordUpdateLoading());
      await _repository.updatePassword(username, currentPassword, newPassword);
      emit(PasswordUpdateSuccess());
    } on ApiException catch (error) {
      emit(PasswordUpdateFailure(error));
    }
  }
}
