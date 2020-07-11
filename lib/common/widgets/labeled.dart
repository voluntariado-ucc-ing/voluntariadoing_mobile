import 'package:flutter/material.dart';

class Labeled extends StatelessWidget {
  final Widget child;
  final String text;
  final AlignmentGeometry alignment;

  const Labeled({
    Key key, 
    this.text, 
    this.child, 
    this.alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: alignment ?? Alignment.centerLeft,
          child: Text(
            text ?? '',
            style: Theme.of(context).textTheme.subtitle1
              .copyWith(fontFamily: 'Nunito_900')
          ),
        ),
      ),
      if (child != null)
        child
    ]
  );
}
