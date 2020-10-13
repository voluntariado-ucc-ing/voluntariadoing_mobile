part of 'password_update_cubit.dart';

@immutable
abstract class PasswordUpdateState {}

class PasswordUpdateInitial extends PasswordUpdateState {}

class PasswordUpdateLoading extends PasswordUpdateState {}

class PasswordUpdateSuccess extends PasswordUpdateState {}

class PasswordUpdateFailure extends PasswordUpdateState {
  final ApiException error;
  PasswordUpdateFailure(this.error);
}
