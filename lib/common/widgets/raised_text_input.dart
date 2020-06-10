import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class RaisedTextInput extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String) onChanged;

  RaisedTextInput({
    @required this.controller, 
    this.obscureText = false,
    this.onChanged, 
    this.hintText,
  });

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.darkerGrey.withOpacity(.1),
            blurRadius: 5,
            offset: Offset(0, 5)
          )
        ]
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration.collapsed(
          hintText: hintText ?? '',
        )
      ),
    )
  );
}