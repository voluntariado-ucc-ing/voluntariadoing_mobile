import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

typedef OnToggle = void Function(int index);

class ToggleSwitch extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final List<String> labels;
  final OnToggle onToggle;
  final int initialLabelIndex;
  final double maxHeigth;

  ToggleSwitch({
    Key key,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.labels,
    this.onToggle,
    this.maxHeigth = 40,
    this.initialLabelIndex = 0,
  }) : super(key: key);

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
    with AutomaticKeepAliveClientMixin<ToggleSwitch> {
  
  final _animationDuration = Duration(milliseconds: 200);
  final _animationCurve = Curves.easeIn;

  int current;

  @override
  void initState() {
    current = widget.initialLabelIndex;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      constraints: BoxConstraints(
        maxHeight: widget.maxHeigth
      ),
      decoration: BoxDecoration(
        borderRadius: WidgetUtils.borderRadius10,
        boxShadow: WidgetUtils.boxShadowLight,
        //color: widget.inactiveColor,
      ),
      child: ClipRRect(
        borderRadius: WidgetUtils.borderRadius10,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: _buildItem,
          itemCount: widget.labels.length,
        ),
      )
    );
  }

  Widget _buildItem(BuildContext ctx, int index) => InkWell(
    onTap: () => _handleOnTap(index),
    child: AnimatedContainer(
      duration: _animationDuration,
      curve: _animationCurve,
      color: index == current 
        ? widget.activeColor
        : widget.inactiveColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: _animationDuration,
            curve: _animationCurve,
            style: Theme.of(context).textTheme.button
              .copyWith(
                fontWeight: index == current 
                  ? FontWeight.w700
                  : FontWeight.w500,
                color: index != current 
                  ? widget.activeColor
                  : widget.inactiveColor,
              ),
            child: Text(
              widget.labels[index],
            )
          ),
        )
      ),
    ),
  );

  void _handleOnTap(int index) async {
    setState(() => current = index);
    if (widget.onToggle != null) {
      widget.onToggle(index);
    }
  }
}
