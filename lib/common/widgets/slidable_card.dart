import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class SlidableCard extends StatelessWidget {
  
  /// A function to call when the card is slided from left to right.
  final VoidCallback leftAction;

  /// A function to call when the card is slided from right to left.
  final VoidCallback rightAction;

  final VoidCallback onPress;
  final Widget leftIcon;
  final Widget rightIcon;
  final Gradient leftGradient;
  final Gradient rightGradient;
  final Widget content;

  SlidableCard({
    @required this.content,
    this.leftAction,
    this.rightAction,
    this.leftIcon,
    this.rightIcon,
    this.leftGradient,
    this.rightGradient,
    this.onPress,
    Key key
  }) : assert(leftAction != null || rightAction != null),
      super(key: key ?? UniqueKey());
  
  @override
  Widget build(BuildContext context) {
    Widget card;
    
    if (leftAction != null && rightAction != null) {
      card = Dismissible(
        key: key,
        background: buildLeftBackground(),
        secondaryBackground: buildRightBackground(),
        child: buildForeground(),
        confirmDismiss: (direction) async {
          _onDismissed(direction);
          return false;
        },
      );
    }
    
    else if (leftAction != null) {
      card = Dismissible(
        key: key,
        direction: DismissDirection.startToEnd,
        background: buildLeftBackground(),
        child: buildForeground(),
        confirmDismiss: (direction) async {
          _onDismissed(direction);
          return false;
        },
      );
    }

    else {
      card = Dismissible(
        key: key,
        direction: DismissDirection.endToStart,
        background: Container(),
        secondaryBackground: buildRightBackground(),
        child: buildForeground(),
        confirmDismiss: (direction) async {
          _onDismissed(direction);
          return false;
        },
      );
    }

    return card;
    
  }

  void _onDismissed(DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      rightAction();
    } else if (direction == DismissDirection.startToEnd) {
      leftAction();
    }
  }

  Widget buildLeftBackground() => Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      gradient: leftGradient,
      borderRadius: WidgetUtils.borderRadius10,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30),
      child: leftIcon,
    ),
  );

  Widget buildRightBackground() => Container(
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      gradient: rightGradient,
      borderRadius: WidgetUtils.borderRadius10,
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 30),
      child: rightIcon,
    ),
  );

  Widget buildForeground() => Container(
    decoration: BoxDecoration(
      borderRadius: WidgetUtils.borderRadius10,
      boxShadow: WidgetUtils.boxShadowLighter
    ),
    child: Material(
      color: Colors.white,
      borderRadius: WidgetUtils.borderRadius10,
      child: InkWell(
        onTap: onPress,
        borderRadius: WidgetUtils.borderRadius10,
        splashColor: ColorPalette.lightGrey,
        child: content
      ),
    )
  );
}