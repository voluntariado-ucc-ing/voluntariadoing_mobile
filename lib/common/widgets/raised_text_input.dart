import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/config/widget_utils.dart';

class RaisedTextInput extends StatefulWidget {

  final String hintText;
  final bool expanded;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  

  RaisedTextInput({
    this.controller,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.expanded = false,
  });

  @override
  _RaisedTextInputState createState() => _RaisedTextInputState();
}

class _RaisedTextInputState extends State<RaisedTextInput> {

  ScrollController _scrollController;

  @override
  void initState() {
    if (widget.expanded) {
      _scrollController = ScrollController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: WidgetUtils.borderRadius10,
      boxShadow: WidgetUtils.boxShadowLighter
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        scrollController: _scrollController,
        maxLines: widget.expanded ? 5 : 1,
        decoration: InputDecoration.collapsed(
          hintText: widget.hintText ?? '',
        )
      ),
    ),
  );
}
