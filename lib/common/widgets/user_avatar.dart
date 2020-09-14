import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class UserAvatar extends StatelessWidget {
  
  final String url;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onPress;

  UserAvatar({
    @required this.url,
    this.borderColor,
    this.onPress,
    this.radius = 30,
    this.borderWidth = 3
  });

  // For more information see https://en.wikipedia.org/wiki/Diameter
  double get diameter => (radius - borderWidth) * 2;
  
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPress,
    child: CachedNetworkImage(
      imageUrl: url ?? '',
      imageBuilder: (_, imageProvider) => Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider, fit: BoxFit.cover),
          border: Border.all(
            color: borderColor ?? ColorPalette.primaryBlue,
            width: borderWidth
          ),
        ),
      ),
      placeholder: (_, url) => Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPalette.lightGrey
        ),
        child: CircularProgressIndicator(
          strokeWidth: borderWidth,
          valueColor: AlwaysStoppedAnimation(ColorPalette.primaryBlue),
        ),
      ),
      errorWidget: (_, url, error) => Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? ColorPalette.primaryBlue,
            width: borderWidth
          ),
          color: ColorPalette.lightGrey
        ),
        child: Icon(Icons.error),
      ),
    ),
  );
  
}