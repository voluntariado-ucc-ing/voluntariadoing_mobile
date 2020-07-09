import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class SwitchButton extends StatefulWidget {
  final String opt1;
  final String opt2;
  final Color color;
  final Function(bool) onTap;

  SwitchButton({
      @required this.opt1,
      @required this.opt2,
      @required this.color,
      @required this.onTap,
      Key key})
      : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  
  Color colorSwich1;
  Color colorSwich2;
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            color: ColorPalette.darkerGrey.withOpacity(.2),
            blurRadius: 10,
            offset: Offset(0, 10))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            setState(() {
              state = !state;
            });
            widget.onTap(state);
          },
          child: Material(
            color: Colors.white,
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 50),
                  curve: Curves.easeIn,
                  left: state ? 0 : 125,
                  child: Container(
                    color: widget.color,
                    height: 60,
                    width: 125,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _text(widget.opt1, state),
                      _text(widget.opt2, !state)
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String text, bool state) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: AnimatedDefaultTextStyle(
        style: Theme.of(context).textTheme.caption.copyWith(
                color: state ? Colors.white : ColorPalette.primaryBlue,
                fontWeight: FontWeight.w900,
                fontSize: 12
              ),
        duration: Duration(milliseconds: 250),
        child: Text(
          text
        ),
      ),
    );
  }
}