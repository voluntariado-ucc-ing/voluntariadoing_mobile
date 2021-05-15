import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';
import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';
import 'package:voluntariadoing_mobile/volunteer/repositories/volunteer_repository.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  VolunteerRepository _repository;

  CompleteProfileCubit({VolunteerRepository repository})
      : _repository = repository ?? VolunteerRepository(),
        super(CompleteProfileInitial());

  Future<void> completeProfile(Volunteer volunteer) async {
    try {
      emit(CompleteProfileLoading());
      await _repository.completeProfile(volunteer);
      emit(CompleteProfileSuccess());
    } on ApiException catch (error) {
      emit(CompleteProfileFailure(error));
    }
  }
}
