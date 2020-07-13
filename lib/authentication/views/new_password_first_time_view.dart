import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/primary_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/config/app_routes.dart';


class NewPasswordFirstTimeView extends StatefulWidget {

  const NewPasswordFirstTimeView({
    Key key,
  }) : super(key: key);

  @override
  _NewPasswordFirstTimeViewState createState() => _NewPasswordFirstTimeViewState();
}

class _NewPasswordFirstTimeViewState extends State<NewPasswordFirstTimeView> {

  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _newPasswordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: ScrollConfiguration(
        behavior: NoOverscrollBehavior(), 
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          children: <Widget>[
            SectionTitle(
              title: 'AUTHENTICATION.UPDATE_PASSWORD_TITLE'.tr(),
              description: 'AUTHENTICATION.UPDATE_PASSWORD_SUBTITLE'.tr()
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Labeled(
                label: 'AUTHENTICATION.NEW_PASSWORD'.tr(),
                child: RaisedTextInput(
                  controller: _newPasswordController,
                  hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Labeled(
                label: 'AUTHENTICATION.NEW_PASSWORD_CONFIRMATION'.tr(),
                child: RaisedTextInput(
                  controller: _newPasswordConfirmationController,
                  hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: PrimaryButton(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(AppRoutes.completeProfile);
                },
                text: "COMMON.CONFIRM".tr()
              )
            ),
          ]
        ),
      ),
    )
  );
}







