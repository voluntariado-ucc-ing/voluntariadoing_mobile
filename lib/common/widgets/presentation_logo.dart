import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class PresentationLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset('assets/images/splash/illustration.svg'),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          'VOLUNTARIADO',
          style: Theme.of(context).textTheme.headline4
            .copyWith(
              color: ColorPalette.primaryBlue,
              fontWeight: FontWeight.w900
            )
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingeniería',
              style: Theme.of(context).textTheme.headline5
                .copyWith(
                  color: ColorPalette.grey,
                  fontWeight: FontWeight.w700
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
                child: Text(
                'UCC',
                style: Theme.of(context).textTheme.headline5
                  .copyWith(
                    color: ColorPalette.darkGrey,
                    fontWeight: FontWeight.w900
                  )
              ),
            )
          ],
        )
      ),
    ],
  );
}