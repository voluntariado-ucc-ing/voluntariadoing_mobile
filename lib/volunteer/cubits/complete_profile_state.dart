part of 'complete_profile_cubit.dart';

@immutable
abstract class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}

class CompleteProfileLoading extends CompleteProfileState {}

class CompleteProfileSuccess extends CompleteProfileState {}

class CompleteProfileFailure extends CompleteProfileState {
  final ApiException error;
  CompleteProfileFailure(this.error);
}

