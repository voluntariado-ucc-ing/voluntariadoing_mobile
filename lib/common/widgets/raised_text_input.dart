import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class RaisedTextInput extends StatelessWidget {
/*
  Si se va a utilizar expandido, es necesario poner un controlador de scroll,
  no se si cuando se usa un controller hay que usar un initState y despues un dispose, si alguien 
  lo sabe que me diga no santi o si santi
*/

  final String hintText;
  final bool expanded;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final ScrollController scrollController;

  RaisedTextInput({
    @required this.controller,
    this.obscureText = false,
    this.onChanged,
    this.hintText,
    this.expanded = false,
    this.scrollController,
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
                  offset: Offset(0, 5))
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              scrollController: scrollController,
              maxLines: expanded ? 5 : 1,
              decoration: InputDecoration.collapsed(
                hintText: hintText ?? '',
              )),
        ),
      );
}
