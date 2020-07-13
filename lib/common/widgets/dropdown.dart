import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;

  Dropdown({Key key, this.items}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownHint;
  String dropdownValue;

  @override
  void initState() {
    dropdownHint = 'COMMON.DROPDOWN_HINT'.tr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: WidgetUtils.borderRadius10,
        boxShadow: WidgetUtils.boxShadowLighter
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            dropdownHint,
            style: Theme.of(context).textTheme.subtitle2
              .copyWith(color: ColorPalette.grey),
          ),
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          elevation: 16,
          dropdownColor: Colors.white,
          style: Theme.of(context).textTheme.button,
          onChanged: (String newValue) => setState(() => dropdownValue = newValue),
          items: widget.items.map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            )
          ).toList(),
        )
      ),
    )
  );
}
