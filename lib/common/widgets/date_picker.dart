import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

typedef OnSelected = void Function(DateTime);

class DatePicker extends StatefulWidget {

  final DateTime firstDate;
  final DateTime lastDate;
  final OnSelected onSelected;
  final double maxWidth;
  
  DatePicker({
    @required this.firstDate,
    @required this.lastDate,
    this.onSelected,
    this.maxWidth = 250,
    Key key
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  DateTime selectedDate;
  String displayText;
  bool hasBeenSelected = false;

  @override
  void initState() {
    selectedDate = DateTime.now();
    displayText = 'COMMON.DATE_PICKER_HINT'.tr();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(
      maxWidth: widget.maxWidth
    ),
    decoration: BoxDecoration(
      borderRadius: WidgetUtils.borderRadius10,
      boxShadow: WidgetUtils.boxShadowLighter
    ),
    child: Material(
      borderRadius: WidgetUtils.borderRadius10,
      color: Colors.white,
      child: InkWell(
        onTap:_selectDate,
        borderRadius: WidgetUtils.borderRadius10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: hasBeenSelected 
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                displayText,
                style: Theme.of(context).textTheme.button
                  .copyWith(
                    color: hasBeenSelected 
                      ? ColorPalette.darkGrey
                      : ColorPalette.grey,
                    fontWeight: hasBeenSelected 
                      ? FontWeight.w700
                      : FontWeight.w500
                  )
              ),
              if (!hasBeenSelected)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.calendar_today, color: ColorPalette.grey)
                )
            ],
          )
        ),
      )
    )
  );

  Future<void> _selectDate() async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate
    );

    if (selected == null) return;
    
    final formattedDate = DateFormat.yMd(context.locale.languageCode).format(selected);

    setState(() {
      selectedDate = selected;
      displayText = formattedDate;
      hasBeenSelected = true;
    });

    if (widget.onSelected != null) {
      widget.onSelected(selected);
    }
  }
}