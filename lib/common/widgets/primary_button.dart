import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class PrimaryButton extends StatelessWidget {
  
  final VoidCallback onTap;
  final String text;
  
  PrimaryButton({
    Key key,
    @required this.onTap,
    @required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.darkerGrey.withOpacity(.2),
            blurRadius: 10,
            offset: Offset(0, 10)
          )
        ]
      ),
      child: Material(
        color: ColorPalette.primaryBlue,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap, 
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.button
                  .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900
                  )
                ),
            ),
          )
        ),
      ),
  );
}