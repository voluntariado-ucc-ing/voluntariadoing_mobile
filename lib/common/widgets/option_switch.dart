import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class OptionSwitchOption {
  final String name;
  final dynamic value;

  OptionSwitchOption({
    @required this.name, 
    @required this.value
  });
}

typedef OnOptionChanged = void Function(OptionSwitchOption);

class OptionSwitch extends StatefulWidget {

  final OptionSwitchOption inactiveOption;
  final OptionSwitchOption activeOption;
  final OnOptionChanged onChanged;

  OptionSwitch({
    @required this.inactiveOption,
    @required this.activeOption,
    this.onChanged
  });
  
  @override
  _OptionSwitchState createState() => _OptionSwitchState();
}

class _OptionSwitchState extends State<OptionSwitch> {

  bool _value = false;
  
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        widget.inactiveOption.name,
        style: Theme.of(context).textTheme.button
          .copyWith(
            fontFamily: 'Nunito_900',
            color: !_value 
              ? ColorPalette.red
              : ColorPalette.grey
          ),
      ),
      _buildSwitch(),
      Text(
        widget.activeOption.name,
        style: Theme.of(context).textTheme.button
          .copyWith(
            fontFamily: 'Nunito_900',
            color: _value 
              ? ColorPalette.primaryBlue
              : ColorPalette.grey
          ),
      ),
    ],
  );

  Widget _buildSwitch() => Container(
    padding: const EdgeInsets.all(0),
    height: 30,
    child: Switch(
      onChanged: _onChanged,
      value: _value,
      activeColor: ColorPalette.primaryBlue,
      inactiveTrackColor: ColorPalette.red.withOpacity(.5),
      inactiveThumbColor: ColorPalette.red,
    ),
  );

  void _onChanged(bool value) {
    setState(() => _value = value);
    if (widget.onChanged != null) {
      final option = _value 
        ? widget.activeOption : widget.inactiveOption;
      widget.onChanged(option);
    }
  }
}