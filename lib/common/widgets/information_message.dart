import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:voluntariadoing_mobile/config/color_palette.dart';

class InformationMessage extends StatelessWidget {
  final String title;
  final String content;
  final Widget leading;
  final Color buttonColor;

  InformationMessage({
    this.title,
    this.content,
    this.leading,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: _buildTitle(),
        content: content != null ? Text(content) : null,
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).maybePop(),
            child: Text(
              'COMMON.CONFIRM'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: ColorPalette.darkGrey),
            ),
            color: buttonColor,
          )
        ],
      );

  Widget _buildTitle() {
    if (title == null) return null;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: leading,
          ),
        Flexible(
          child: Text(
            title,
          ),
        )
      ],
    );
  }
}
