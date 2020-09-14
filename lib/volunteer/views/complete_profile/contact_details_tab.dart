import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

class ContactDetailsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
    behavior: NoOverscrollBehavior(),
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      children: [
        SectionTitle(
          subtitle: 'AUTHENTICATION.CONTACT_DETAILS_SUBTITLE'.tr(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'AUTHENTICATION.EMAIL'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.EMAIL_HINT'.tr(),
            ),
          ),
        ),
       Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'AUTHENTICATION.TELEPHONE'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.TELEPHONE_HINT'.tr(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'AUTHENTICATION.CITY'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.CITY_HINT'.tr(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'AUTHENTICATION.STREET'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.STREET_HINT'.tr(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'AUTHENTICATION.NUMBER'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.NUMBER_HINT'.tr(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'AUTHENTICATION.POSTAL'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.POSTAL_HINT'.tr(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15 , bottom: 250),
          child: Labeled(
            label: 'AUTHENTICATION.OPTIONAL'.tr(),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.OPTIONAL_HINT'.tr(),
              expanded: true,
            ),
          ),
        ),
      ],
    )
  );
}