import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluntariadoing_mobile/config/app_routes.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Voluntariado UCC',
      theme: ThemeData(
        cursorColor: ColorPalette.primaryBlue,
        textTheme: GoogleFonts.nunitoTextTheme(textTheme).copyWith(
          headline4: GoogleFonts.nunito(textStyle: textTheme.headline4.copyWith(fontWeight: FontWeight.w900)),
          headline5: GoogleFonts.nunito(textStyle: textTheme.headline5.copyWith(fontWeight: FontWeight.w900)),
          headline6: GoogleFonts.nunito(textStyle: textTheme.headline6.copyWith(fontWeight: FontWeight.w900))
        )
      ),
      routes: AppRoutes.routes,
    );
  }

}