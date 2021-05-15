import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';
import 'package:voluntariadoing_mobile/donations/models/donation.dart';
import 'package:voluntariadoing_mobile/donations/repositories/donations_repository.dart';

part 'donations_state.dart';

class DonationsCubit extends Cubit<DonationsState> {
  DonationsRepository _repository;

  DonationsCubit({DonationsRepository repository})
      : _repository = repository ?? DonationsRepository(),
        super(DonationsInitial());

  void getDonations() async {
    try {
      emit(DonationsLoading());
      final donations = await _repository.list();
      emit(DonationsSuccess(donations));
    } on ApiException catch (error) {
      emit(DonationsFailure(error));
    }
  }
}
