import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class PrimaryButton extends StatelessWidget {
  
  final VoidCallback onTap;
  final Widget child;
  
  PrimaryButton({
    Key key,
    @required this.onTap,
    @required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        borderRadius: WidgetUtils.borderRadius20,
        boxShadow: WidgetUtils.boxShadowLight
      ),
      child: Material(
        color: ColorPalette.primaryBlue,
        borderRadius: WidgetUtils.borderRadius20,
        child: InkWell(
          borderRadius: WidgetUtils.borderRadius20,
          onTap: onTap, 
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: child
            ),
          )
        ),
      ),
  );
}