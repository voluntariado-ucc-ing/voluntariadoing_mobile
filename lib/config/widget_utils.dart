import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

abstract class WidgetUtils {

  static final borderRadius10 = BorderRadius.circular(10);
  static final borderRadius20 = BorderRadius.circular(20);
  static final borderRadius40 = BorderRadius.circular(40);
  
  static final boxShadowLight = [
    BoxShadow(
      color: ColorPalette.darkerGrey.withOpacity(.2),
      blurRadius: 10,
      offset: Offset(0, 10)
    )
  ];

  static final boxShadowLighter = [
    BoxShadow(
      color: ColorPalette.darkerGrey.withOpacity(.1),
      blurRadius: 5,
      offset: Offset(0, 5)
    )
  ];

  static double getWidthPercentage(BuildContext ctx, double percentage)
    => (MediaQuery.of(ctx).size.width * percentage) / 100;

}