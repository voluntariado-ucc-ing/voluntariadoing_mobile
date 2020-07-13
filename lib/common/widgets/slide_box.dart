import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class SlideBox extends StatefulWidget {
  SlideBox({Key key}) : super(key: key);

  @override
  _SlideBoxState createState() => _SlideBoxState();
}

class _SlideBoxState extends State<SlideBox> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }


  Widget _boxContainer(Widget child) => Container(
      decoration: BoxDecoration(
        borderRadius: WidgetUtils.borderRadius40,
        boxShadow: WidgetUtils.boxShadowLight
      ),
      child: child,
  );
}