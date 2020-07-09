import 'package:flutter/material.dart';

class AboveText extends StatelessWidget {
  final Widget child;
  final String text;
  final AlignmentGeometry alignment;

  const AboveText({
    Key key, 
    this.text, 
    this.child,
    this.alignment
    }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: alignment ?? Alignment.bottomLeft,
            child: Text(
              text ?? '',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        child,
      ]);
}
