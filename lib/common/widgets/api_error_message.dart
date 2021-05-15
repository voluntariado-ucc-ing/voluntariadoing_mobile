import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/exceptions/api_exception.dart';
import 'package:voluntariadoing_mobile/common/widgets/information_message.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class ApiErrorMessage extends StatelessWidget {
  final ApiException error;

  ApiErrorMessage({@required this.error});

  @override
  Widget build(BuildContext context) => InformationMessage(
        title: error.title,
        content: error.reason,
        leading: _buildLeading(),
        buttonColor: ColorPalette.red,
      );

  Widget _buildLeading() => Icon(Icons.error, color: ColorPalette.red);
}
