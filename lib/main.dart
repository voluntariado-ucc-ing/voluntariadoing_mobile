import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluntariadoing_mobile/config/app_routes.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Voluntariado UCC',
    theme: ThemeData(
      cursorColor: ColorPalette.primaryBlue,
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme
      )
    ),
    routes: AppRoutes.routes,
  );

}