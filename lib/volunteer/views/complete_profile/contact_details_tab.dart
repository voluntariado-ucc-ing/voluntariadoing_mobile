import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

class ContactDetailsTab extends StatelessWidget {
  final void Function(String) onEmailChanged;
  final void Function(String) onPhoneChanged;
  final void Function(String) onCityChanged;
  final void Function(String) onStreetChanged;
  final void Function(String) onNumberChanged;
  final void Function(String) onPostalCodeChanged;
  final void Function(String) onDetailsChanged;

  ContactDetailsTab({
    this.onEmailChanged,
    this.onPhoneChanged,
    this.onCityChanged,
    this.onStreetChanged,
    this.onNumberChanged,
    this.onPostalCodeChanged,
    this.onDetailsChanged,
  });

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
                onChanged: onEmailChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.TELEPHONE'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.TELEPHONE_HINT'.tr(),
                onChanged: onPhoneChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.CITY'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.CITY_HINT'.tr(),
                onChanged: onCityChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.STREET'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.STREET_HINT'.tr(),
                onChanged: onStreetChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.NUMBER'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.NUMBER_HINT'.tr(),
                keyboardType: TextInputType.number,
                onChanged: onNumberChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.POSTAL'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.POSTAL_HINT'.tr(),
                keyboardType: TextInputType.number,
                onChanged: onPostalCodeChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.OPTIONAL'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.OPTIONAL_HINT'.tr(),
                expanded: true,
                onChanged: onDetailsChanged,
              ),
            ),
          ),
          SizedBox(height: 100)
        ],
      ));
}
