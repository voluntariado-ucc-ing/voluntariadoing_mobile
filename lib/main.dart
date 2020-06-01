import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Voluntariado UCC',
    theme: ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(
        Theme.of(context).textTheme
      )
    ),
    home: Placeholder(),
  );

}

class Placeholder extends StatelessWidget {
  
  // TODO: all of it

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(),
  );
}