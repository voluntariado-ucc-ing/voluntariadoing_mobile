import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';
import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';
import 'package:voluntariadoing_mobile/volunteer/repositories/volunteer_repository.dart';

part 'volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {
  VolunteerRepository _repository;

  VolunteerCubit({VolunteerRepository repository})
      : _repository = repository ?? VolunteerRepository(),
        super(VolunteerInitial());

  void getVolunteer(int id) async {
    try {
      emit(VolunteerLoading());
      final volunteer = await _repository.getById(id);
      emit(VolunteerSuccess(volunteer));
    } on ApiException catch (error) {
      emit(VolunteerFailure(error));
    }
  }
}
