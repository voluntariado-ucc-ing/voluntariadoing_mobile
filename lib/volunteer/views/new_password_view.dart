import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/primary_text_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';


class NewPasswordView extends StatefulWidget {

  const NewPasswordView({
    Key key,
  }) : super(key: key);

  @override
  _NewPasswordViewState createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {

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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Labeled(
                label: 'AUTHENTICATION.CURRENT_PASSWORD'.tr(),
                child: RaisedTextInput(
                  hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Labeled(
                label: 'AUTHENTICATION.NEW_PASSWORD'.tr(),
                child: RaisedTextInput(
                  hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Labeled(
                label: 'AUTHENTICATION.NEW_PASSWORD_CONFIRMATION'.tr(),
                child: RaisedTextInput(
                  hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: PrimaryTextButton(
                onTap: (){},
                text: "COMMON.CONFIRM".tr()
              )
            ),
          ]
        ),
      ),
    )
  );
}







