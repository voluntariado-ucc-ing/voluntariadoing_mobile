import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/donations/views/donations_view.dart';
import 'package:voluntariadoing_mobile/volunteer/models/medical_info_item.dart';
import 'package:voluntariadoing_mobile/volunteer/widgets/medical_info_item_entry.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/primary_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

class MedicalInformationTab extends StatefulWidget {
  
  @override
  _MedicalInformationTabState createState() => _MedicalInformationTabState();
}

class _MedicalInformationTabState extends State<MedicalInformationTab> 
  with NavigatorMixin {
  
  final List<MedicalInfoItem> items = [];

  @override
  void initState() {
    // _volunteerRepo.getMedicalInformation().then(
    //   (value) => setState(() => items.addAll(value)));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => ScrollConfiguration(
    behavior: NoOverscrollBehavior(),
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      children: [
        SectionTitle(
          subtitle: 'AUTHENTICATION.MEDICAL_INFORMATION_SUBTITLE'.tr(),
          description: 'AUTHENTICATION.MEDICAL_INFORMATION_DESCRIPTION'.tr(),
        ),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: MedicalInfoItemEntry(item: item)
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          child: PrimaryButton(
            onTap: () => 
              pushReplacement(context, DonationsView()), 
            text: 'COMMON.FINISH'.tr()
          ),
        )
      ],
    )
  );
}