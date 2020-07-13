import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class SecondaryButton extends StatelessWidget {

  final VoidCallback onTap;
  final String text;

  SecondaryButton({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) => FlatButton(
    shape: RoundedRectangleBorder(
      borderRadius: WidgetUtils.borderRadius20
    ),
    onPressed: onTap, 
    child: Text(
      text,
      style: Theme.of(context).textTheme.button
        .copyWith(
          color: ColorPalette.darkerGrey,
          fontWeight: FontWeight.w500
        )
    )
  );
}