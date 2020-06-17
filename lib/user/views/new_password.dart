import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/date_picker.dart';
import 'package:voluntariadoing_mobile/common/widgets/switch_button.dart';

import '../../config/color_palette.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key key}) : super(key: key);

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
                primaryColor: ColorPalette.primaryBlue,
                onTap: ( index ) {
                },
              ),
            ),
            SizedBox(height: 100),
            ComboBox(),
            SizedBox(height: 100),
            DatePicker(
              onTap: ( DateTime date ){
                print(date);
              },
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







