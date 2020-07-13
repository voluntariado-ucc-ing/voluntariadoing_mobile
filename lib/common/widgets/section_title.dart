import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final String subtitle;
  final String description;

  SectionTitle({
    this.title, 
    this.subtitle, 
    this.description,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (title != null)
        _buildRow(
          AutoSizeText(
            title,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline4
              .copyWith(color: ColorPalette.darkerGrey),
          )
        ),
      if (subtitle != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: _buildRow(
            AutoSizeText(
              subtitle,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline5
                .copyWith(color: ColorPalette.primaryBlue),
            )
          )
        ),
      if (description != null)
        _buildRow(
          Text(
            description,
            style: Theme.of(context).textTheme.subtitle1
              .copyWith(color: ColorPalette.grey),
          )
        )
    ],
  );

  Widget _buildRow(Widget text) => Row(
    children: [
      Flexible(
        child: text
      )
    ],
  );
}