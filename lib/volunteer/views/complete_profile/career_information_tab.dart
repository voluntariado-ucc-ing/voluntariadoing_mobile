import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:voluntariadoing_mobile/common/widgets/dropdown.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/common/widgets/toggle_switch.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/volunteer/providers/careers_provider.dart';
import 'package:voluntariadoing_mobile/volunteer/providers/universities_provider.dart';

class CareerInformationTab extends StatefulWidget {
  final void Function(String) onCareerConditionChanged;
  final void Function(String) onUniversityChanged;
  final void Function(String) onCareerChanged;

  final UniversitiesProvider universitiesProvider;
  final CareersProvider careersProvider;

  CareerInformationTab({
    UniversitiesProvider universitiesProvider,
    CareersProvider careersProvider,
    this.onCareerConditionChanged,
    this.onUniversityChanged,
    this.onCareerChanged,
  })  : universitiesProvider = universitiesProvider ?? UniversitiesProvider(),
        careersProvider = careersProvider ?? CareersProvider();

  @override
  _CareerInformationTabState createState() => _CareerInformationTabState();
}

class _CareerInformationTabState extends State<CareerInformationTab> {
  final _universities = <String>[];
  final _careers = <String>[];
  final _status = ['Estudiante', 'Egresado'];

  @override
  void initState() {
    widget.universitiesProvider.getUniversities().then((value) {
      setState(() => _universities.addAll(value));
    });
    widget.careersProvider.getCareers().then((value) {
      setState(() => _careers.addAll(value));
    });
    super.initState();
  }

  Widget build(BuildContext context) => ScrollConfiguration(
      behavior: NoOverscrollBehavior(),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          SectionTitle(
            subtitle: 'AUTHENTICATION.CAREER_INFORMATION_SUBTITLE'.tr(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'AUTHENTICATION.CURRENT_STATE'.tr(),
              child: ToggleSwitch(
                activeColor: ColorPalette.primaryBlue,
                inactiveColor: Colors.white,
                labels: _status,
                onToggle: (i) => widget.onCareerConditionChanged(_status[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'COMMON.UNIVERSITY'.tr(),
              child: Dropdown(
                items: _universities,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Labeled(
              label: 'COMMON.CAREER'.tr(),
              child: Dropdown(
                items: _careers,
              ),
            ),
          )
        ],
      ));
}
