import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class Labeled extends StatelessWidget {
  final Widget child;
  final String label;

  const Labeled({
    Key key, 
    this.label, 
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          label ?? '',
          style: Theme.of(context).textTheme.subtitle1
            .copyWith(
              fontFamily: 'Nunito_900',
              color: ColorPalette.darkGrey
            )
        ),
      ),
      if (child != null)
        child
    ]
  );
}
