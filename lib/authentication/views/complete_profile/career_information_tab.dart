import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/dropdown.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/common/widgets/toggle_switch.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';


class CareerInformationTab extends StatelessWidget {

 
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
              labels: ['Estudiante', 'Egresado']
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'COMMON.UNIVERSITY'.tr(),
            child: Dropdown(
              items: [
                "UCC",
                "UNC",
                "UBA",
                "UBP",
                "FAMAF",
                "FUCC",
                "SIGLO XXI"
                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Labeled(
            label: 'COMMON.CAREER'.tr(),
            child: Dropdown(
              items: [
                "ING. Sistemas",
                "ING. Mecanica",
                "ING. Industrial",
                "ING. Electronica",
                "Medicina",
                "Cs. Sociales",
                "Cs. Economica"
                ]
              )
          ),
        )
      ],
    )
  );
}

