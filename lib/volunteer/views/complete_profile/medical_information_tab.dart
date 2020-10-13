import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/common/widgets/loading_text_button.dart';
import 'package:voluntariadoing_mobile/volunteer/models/medical_info_item.dart';
import 'package:voluntariadoing_mobile/volunteer/providers/medical_information_provider.dart';
import 'package:voluntariadoing_mobile/volunteer/widgets/medical_info_item_entry.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';

class MedicalInformationTab extends StatefulWidget {
  final MedicalInformationProvider provider;
  final VoidCallback onFinishPressed;
  final bool isLoading;

  MedicalInformationTab({
    MedicalInformationProvider provider,
    this.onFinishPressed,
    this.isLoading,
  }) : provider = provider ?? MedicalInformationProvider();

  @override
  _MedicalInformationTabState createState() => _MedicalInformationTabState();
}

class _MedicalInformationTabState extends State<MedicalInformationTab>
    with NavigatorMixin {
  final List<MedicalInfoItem> items = [];

  @override
  void initState() {
    widget.provider
        .getMedicalInformation()
        .then((value) => setState(() => items.addAll(value)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
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
              child: MedicalInfoItemEntry(item: item),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
            child: LoadingTextButton(
              onTap: widget.onFinishPressed,
              text: 'COMMON.FINISH'.tr(),
              isLoading: widget.isLoading,
            ),
          ),
          SizedBox(height: 60)
        ],
      ),
    );
  }
}
