import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;

  Dropdown({this.items, Key key}) : super(key: key);

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
    decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: WidgetUtils.borderRadius10,
        boxShadow: WidgetUtils.boxShadowLight
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(dropdownHint),
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: ColorPalette.grey, fontWeight: FontWeight.w800),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        )
      )
    );
}
