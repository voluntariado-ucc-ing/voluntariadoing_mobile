import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voluntariadoing_mobile/authentication/cubits/authentication_cubit.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/common/models/direction.dart';
import 'package:voluntariadoing_mobile/common/widgets/api_error_message.dart';
import 'package:voluntariadoing_mobile/donations/views/donations_view.dart';
import 'package:voluntariadoing_mobile/volunteer/cubits/complete_profile_cubit.dart';
import 'package:voluntariadoing_mobile/volunteer/models/volunteer.dart';
import 'package:voluntariadoing_mobile/volunteer/views/complete_profile/contact_details_tab.dart';
import 'package:voluntariadoing_mobile/volunteer/views/complete_profile/medical_information_tab.dart';
import 'package:voluntariadoing_mobile/volunteer/views/complete_profile/career_information_tab.dart';
import 'package:voluntariadoing_mobile/volunteer/views/complete_profile/personal_information_tab.dart';
import 'package:voluntariadoing_mobile/common/views/stepped_view.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

part 'personal_information_state.dart';
part 'contact_details_state.dart';
part 'career_information_state.dart';

class CompleteProfileView extends StatefulWidget {
  @override
  _CompleteProfileViewState createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView>
    with
        PersonalInformationState,
        ContactDetailState,
        CareerInformationState,
        NavigatorMixin,
        AutomaticKeepAliveClientMixin {
  AuthenticationCubit authCubit;
  CompleteProfileCubit completeProfileCubit;

  @override
  bool get wantKeepAlive => true;

  void _onFinishPressed() {
    final id = (authCubit.state as AuthenticationSuccess).authenticationUser.volunteerId;
    final volunteer = Volunteer(
      id: id,
      firstName: name,
      lastName: lastName,
      details: VolunteerDetails(
        contactEmail: email,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        career: career,
        university: university,
        careerCondition: careerCondition,
        direction: Direction(
          city: city,
          details: details,
          number: number,
          postalCode: postalCode,
          street: street
        )
      )
    );
    completeProfileCubit.completeProfile(volunteer);
  }

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthenticationCubit>(context);
    completeProfileCubit = CompleteProfileCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => completeProfileCubit,
      child: BlocListener<CompleteProfileCubit, CompleteProfileState>(
        listener: (_, state) {
          if (state is CompleteProfileSuccess) {
            pushReplacement(
              context,
              BlocProvider.value(
                value: authCubit,
                child: DonationsView(),
              ),
            );
          } else if (state is CompleteProfileFailure) {
            showDialog(
              context: context,
              child: ApiErrorMessage(error: state.error),
            );
          }
        },
        child: _buildView(),
      ),
    );
  }

  Widget _buildView() {
    return SteppedView(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SectionTitle(
          title: 'AUTHENTICATION.COMPLETE_PROFILE_TITLE'.tr(),
        ),
      ),
      pages: [
        PersonalInformationTab(
          onNameChanged: _onNameChanged,
          onLastNameChanged: _onLastNameChanged,
          onBirthDateChanged: _onBirthDateChanged,
        ),
        ContactDetailsTab(
          onEmailChanged: _onEmailChanged,
          onPhoneChanged: _onPhoneNumberChanged,
          onCityChanged: _onCityChanged,
          onStreetChanged: _onStreetChanged,
          onNumberChanged: _onNumberChanged,
          onPostalCodeChanged: _onPostalCodeChanged,
          onDetailsChanged: _onDetailsChanged,
        ),
        CareerInformationTab(
          onCareerConditionChanged: _onCareerConditionChanged,
          onCareerChanged: _onCareerChanged,
          onUniversityChanged: _onUniversityChanged,
        ),
        BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
          builder: (_, state) {
            return MedicalInformationTab(
              isLoading: state is CompleteProfileLoading,
              onFinishPressed: _onFinishPressed,
            );
          },
        )
      ],
    );
  }
}
