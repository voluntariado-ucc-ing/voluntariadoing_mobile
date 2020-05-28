import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Voluntariado UCC',
    theme: ThemeData(
      primarySwatch: Colors.white
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