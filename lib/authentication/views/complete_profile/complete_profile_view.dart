import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/authentication/views/complete_profile/career_information_tab.dart';
import 'package:voluntariadoing_mobile/authentication/views/complete_profile/personal_information_tab.dart';
import 'package:voluntariadoing_mobile/common/views/stepped_view.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

class CompleteProfileView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => SteppedView(
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SectionTitle(
        title: 'AUTHENTICATION.COMPLETE_PROFILE_TITLE'.tr(),
      ),
    ),
    pages: [
      PersonalInformationTab(),
      PersonalInformationTab(),
      PersonalInformationTab(),
      CareerInformationTab(),
    ],
  );
}