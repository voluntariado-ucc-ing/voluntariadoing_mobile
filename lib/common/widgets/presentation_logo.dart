import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/svg_assets.dart';

class PresentationLogo extends StatelessWidget {

  final bool showImage;
  final bool mini;

  PresentationLogo({
    this.showImage = true,
    this.mini = false
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (showImage) SvgPicture.asset(SvgAssets.logo),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          'Voluntariado',
          style: (mini 
            ? Theme.of(context).textTheme.headline6
            : Theme.of(context).textTheme.headline4)
              .copyWith(
                fontFamily: 'Nunito_900',
                color: ColorPalette.primaryBlue,
              )
        ),
      ),
      Padding(
        padding: mini 
          ? EdgeInsets.zero
          : const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingeniería',
              style: (mini 
                ? Theme.of(context).textTheme.subtitle1
                : Theme.of(context).textTheme.headline5)
                  .copyWith(
                    color: ColorPalette.grey,
                    fontFamily: 'Nunito_Regular',
                    fontWeight: FontWeight.w700
                  )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
                child: Text(
                'UCC',
                style: (mini 
                  ? Theme.of(context).textTheme.subtitle1
                  : Theme.of(context).textTheme.headline5)
                  .copyWith(
                    fontFamily: 'Nunito_900',
                    color: ColorPalette.darkGrey,
                  )
              ),
            )
          ],
        )
      ),
    ],
  );
}