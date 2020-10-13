part of 'volunteer_cubit.dart';

@immutable
abstract class VolunteerState {}

class VolunteerInitial extends VolunteerState {}

class VolunteerLoading extends VolunteerState {}

class VolunteerSuccess extends VolunteerState {
  final Volunteer volunteer;

  VolunteerSuccess(this.volunteer);
}

class VolunteerFailure extends VolunteerState {
  final ApiException error;
  VolunteerFailure(this.error);
}