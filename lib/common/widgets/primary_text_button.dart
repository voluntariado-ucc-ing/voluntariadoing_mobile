import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/primary_button.dart';

class PrimaryTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  PrimaryTextButton({Key key, @required this.onTap, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) => PrimaryButton(
      onTap: onTap,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700)));
}
