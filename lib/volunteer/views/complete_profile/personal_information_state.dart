part of 'complete_profile_view.dart';

mixin PersonalInformationState on State<CompleteProfileView> {
  String name = '';
  
  void _onNameChanged(String value) => name = value;

  String lastName = '';
  
  void _onLastNameChanged(String value) => lastName = value;
  
  DateTime birthDate;

  void _onBirthDateChanged(DateTime value) => birthDate = value;
}