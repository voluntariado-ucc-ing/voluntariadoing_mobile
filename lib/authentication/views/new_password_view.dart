import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/date_picker.dart';
import 'package:voluntariadoing_mobile/common/widgets/switch_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/toggle_switch.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';


class NewPasswordView extends StatelessWidget {
  const NewPasswordView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Center(
              child: SwitchButton(
                opt1: "Estudiante",
                opt2: "Egresado",
                color: ColorPalette.primaryBlue,
                onTap: ( index ) {
                },
              ),
            ),
            SizedBox(height: 100),
            ToggleSwitch(
              activeColor: ColorPalette.primaryBlue,
              inactiveColor: Colors.white,
              labels: ['Estudiante', 'Egresado', 'Profesor']
            ),
            SizedBox(height: 100),
            DatePicker(
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
            ),
          ],
        ),
      ),
    );
  }
}


class ComboBox extends StatefulWidget {

  ComboBox({Key key}) : super(key: key);

  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
       
    );
  }
}







