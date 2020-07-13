import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/common/widgets/primary_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/secondary_button.dart';
import 'package:voluntariadoing_mobile/config/app_routes.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';

class LoginView extends StatefulWidget {
  
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: ScrollConfiguration(
        behavior: NoOverscrollBehavior(),
        child: ListView(
          shrinkWrap: true,
          children: [
            PresentationLogo(),
            _buildInputs()
          ],
        ),
      )
    ),
  );

  Widget _buildInputs() => Padding(
    padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'AUTHENTICATION.LOGIN'.tr(),
              style: Theme.of(context).textTheme.headline5
                .copyWith(
                  color: ColorPalette.darkerGrey,
                  fontWeight: FontWeight.w900
                )
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: RaisedTextInput(
            controller: _mailInputController,
            hintText: 'AUTHENTICATION.EMAIL_HINT'.tr(),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: RaisedTextInput(
            controller: _passwordInputController,
            hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
            obscureText: true,
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
          child: PrimaryButton(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(AppRoutes.completeProfile);
            },
            text: 'AUTHENTICATION.LOGIN'.tr(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SecondaryButton(
            onTap: () => print('forgot'),
            text: 'AUTHENTICATION.FORGOT_PASSWORD'.tr()
          ),
        ),
      ],
    )
  );
}