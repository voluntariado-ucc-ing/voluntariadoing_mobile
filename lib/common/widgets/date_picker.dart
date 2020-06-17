import 'package:flutter/material.dart';
import '../../config/color_palette.dart';


class DatePicker extends StatefulWidget {

  final Function (DateTime) onTap;
  DatePicker({
    Key key,
    @required this.onTap,
    }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  DateTime selectedDate = DateTime.now();

  String _text = 'Seleccionar fecha...';
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.darkerGrey.withOpacity(.1),
            blurRadius: 5,
            offset: Offset(0, 5)
          )
        ]
    ),
    child: InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text( _text,
            style: Theme.of(context).textTheme.button
              .copyWith(
                  color: ColorPalette.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 12
              )
            ),
            Icon( Icons.calendar_today , color: ColorPalette.grey)
          ],
        )
      ),
    )
  );
  }

  Future _selectDate(BuildContext context) async {

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _text = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      });

      widget.onTap(selectedDate);

  }
}