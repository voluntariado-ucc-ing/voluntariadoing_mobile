part of 'donations_cubit.dart';

@immutable
abstract class DonationsState {}

class DonationsInitial extends DonationsState {}

class DonationsLoading extends DonationsState {}

class DonationsSuccess extends DonationsState {
  final List<Donation> donations;
  DonationsSuccess(this.donations);
}

class DonationsFailure extends DonationsState {
  final ApiException error;

  DonationsFailure(this.error);
}

class DonationNewStatus extends DonationsState{

}
