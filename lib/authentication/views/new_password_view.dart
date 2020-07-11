import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/date_picker.dart';
import 'package:voluntariadoing_mobile/common/widgets/dropdown.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/slide_box.dart';
import 'package:voluntariadoing_mobile/common/widgets/switch_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/toggle_switch.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';


class NewPasswordView extends StatefulWidget {


  const NewPasswordView({Key key}) : super(key: key);

  @override
  _NewPasswordViewState createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de Widgets'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
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
            SizedBox(height: 50),
            Labeled(
              text: 'FECHA',
              alignment: Alignment.bottomCenter,
              child: DatePicker(
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
              ),
            ),
            SizedBox(height: 50,),
            Padding(
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: Dropdown(
              items:<String>["a", "b", "c"]
            ),
          ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
              child: Labeled(
                text: 'MUCHO TEXTO',
                child: RaisedTextInput(
                  controller: _controller,
                  hintText: 'Hola nena',
                  expanded: true,
                  ),
              ),
            ),
            SizedBox(height: 50),
            SlideBox(),
          ],
        ),
        ]
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







