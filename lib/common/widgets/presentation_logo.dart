import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:google_fonts/google_fonts.dart';
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
          'Voluntariado',
          style: Theme.of(context).textTheme.headline4
            .copyWith(
              color: ColorPalette.primaryBlue,
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
                  fontFamily: 'Nunito_Regular'
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
                child: Text(
                'UCC',
                style: Theme.of(context).textTheme.headline5
                  .copyWith(
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