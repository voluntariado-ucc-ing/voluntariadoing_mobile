part of 'complete_profile_view.dart';

mixin CareerInformationState on State<CompleteProfileView> {
  String university = '';

  void _onUniversityChanged(String value) => university = value;

  String career = '';

  void _onCareerChanged(String value) => career = value;

  String careerCondition = '';

  void _onCareerConditionChanged(String value) => careerCondition = value;
}
