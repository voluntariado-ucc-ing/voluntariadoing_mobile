import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

typedef OnLabelPressed = void Function(int);

class SelectButtonGroup extends StatefulWidget {

  final List<String> labels;

  /// A function to call when a label is pressed. 
  /// It receives the pressed label index as an argument.
  /// If the label was unselected, it'll receive a null index.
  final OnLabelPressed onLabelPressed;
  
  final int initialIndex;

  final Color selectedColor;

  final Color selectedLabelColor;

  final Color unselectedLabelColor;

  SelectButtonGroup({
    @required this.labels,
    this.onLabelPressed,
    this.initialIndex,
    this.selectedColor = ColorPalette.primaryBlue,
    this.selectedLabelColor = Colors.white,
    this.unselectedLabelColor = ColorPalette.primaryBlue
  });

  @override
  _SelectButtonGroupState createState() => _SelectButtonGroupState();
}

class _SelectButtonGroupState extends State<SelectButtonGroup> {
  
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: 25
    ),
    child: ScrollConfiguration(
      behavior: NoOverscrollBehavior(), 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildLabel,
        itemCount: widget.labels.length,
      ),
    )
  );

  Widget _buildLabel(BuildContext ctx, int index) => Padding(
    padding: const EdgeInsets.only(right: 5),
    child: InkWell(
      borderRadius: WidgetUtils.borderRadius20,
      onTap: () => _onLabelPressed(index),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index
            ? widget.selectedColor
            : Colors.transparent,
          borderRadius: WidgetUtils.borderRadius20
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            widget.labels[index] ?? '',
            style: Theme.of(context).textTheme.caption
            .copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: _selectedIndex == index
                ? widget.selectedLabelColor
                : widget.unselectedLabelColor
            ),
          )
        )
      ),
    ),
  );

  void _onLabelPressed(int index) {
    final value = index == _selectedIndex ? null : index;
    setState(() => _selectedIndex = value);
    if (widget.onLabelPressed != null) {
      widget.onLabelPressed(value);
    }
  }

}