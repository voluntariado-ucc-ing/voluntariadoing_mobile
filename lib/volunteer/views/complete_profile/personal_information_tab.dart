import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:voluntariadoing_mobile/common/widgets/date_picker.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

class PersonalInformationTab extends StatelessWidget {
  final void Function(String) onNameChanged;
  final void Function(String) onLastNameChanged;
  final void Function(DateTime) onBirthDateChanged;

  PersonalInformationTab({
    this.onNameChanged,
    this.onLastNameChanged,
    this.onBirthDateChanged,
  });

  final _firstDate = DateTime(1930, 1, 1);
  final _lastDate = DateTime.now();

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
      behavior: NoOverscrollBehavior(),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          SectionTitle(
            subtitle: 'AUTHENTICATION.PERSONAL_INFORMATION_SUBTITLE'.tr(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.NAME'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.NAME_HINT'.tr(),
                onChanged: onNameChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.LAST_NAME'.tr(),
              child: RaisedTextInput(
                hintText: 'AUTHENTICATION.LAST_NAME_HINT'.tr(),
                onChanged: onLastNameChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.BIRTHDAY'.tr(),
              child: DatePicker(
                firstDate: _firstDate,
                lastDate: _lastDate,
                onSelected: onBirthDateChanged,
              ),
            ),
          )
        ],
      ));
}
