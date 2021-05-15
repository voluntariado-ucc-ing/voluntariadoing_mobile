import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/volunteer/models/medical_info_item.dart';
import 'package:voluntariadoing_mobile/common/widgets/dropdown.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/option_switch.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';

class MedicalInfoItemEntry extends StatelessWidget {

  final MedicalInfoItem item;

  MedicalInfoItemEntry({
    @required this.item
  });

  @override
  Widget build(BuildContext context) => Labeled(
    label: item.title,
    child: _buildItemWidget()
  );

  Widget _buildItemWidget() {
    switch (item.type) {
      case MedicalInfoItemType.SWITCH:
        return OptionSwitch(
          inactiveOption: OptionSwitchOption(
            name: 'COMMON.NO'.tr(),
            value: false
          ), 
          activeOption: OptionSwitchOption(
            name: 'COMMON.YES'.tr(),
            value: true
          ), 
        );
      case MedicalInfoItemType.SELECT:
        return Dropdown(
          items: item.options ?? [],
        );
      case MedicalInfoItemType.TEXT:
        return RaisedTextInput(
          expanded: true,
        );
    }
    return Container();
  }
}