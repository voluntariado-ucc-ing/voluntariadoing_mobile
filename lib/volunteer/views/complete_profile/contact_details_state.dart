part of 'complete_profile_view.dart';

mixin ContactDetailState on State<CompleteProfileView> {
  String email = '';

  void _onEmailChanged(String value) => email = value;

  String phoneNumber = '';

  void _onPhoneNumberChanged(String value) => phoneNumber = value;

  String city = '';

  void _onCityChanged(String value) => city = value;

  String street = '';

  void _onStreetChanged(String value) => street = value;

  int number = 0;

  void _onNumberChanged(String value) => number = int.tryParse(value) ?? 0;

  int postalCode = 0;

  void _onPostalCodeChanged(String value) {
    postalCode = int.tryParse(value) ?? 0;
  }

  String details;

  void _onDetailsChanged(String value) => details = value;
}
