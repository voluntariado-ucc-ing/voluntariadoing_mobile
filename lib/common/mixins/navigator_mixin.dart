import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin NavigatorMixin {
  Future<T> push<T>(BuildContext context, Widget view,
      {bool fullscreenDialog = false}) {
    final route = _buildRoute<T>(context, view, fullscreenDialog);
    return Navigator.of(context).push(route);
  }

  Future<T> pushReplacement<T>(BuildContext context, Widget view,
      {bool fullscreenDialog = false}) {
    final route = _buildRoute<T>(context, view, fullscreenDialog);
    return Navigator.of(context).pushReplacement(route);
  }

  Route<T> _buildRoute<T>(
      BuildContext context, Widget view, bool fullscreenDialog) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (isIOS) {
      return CupertinoPageRoute(
        builder: (ctx) => view,
        fullscreenDialog: fullscreenDialog,
      );
    }
    return MaterialPageRoute(
        builder: (ctx) => view, fullscreenDialog: fullscreenDialog);
  }
}
