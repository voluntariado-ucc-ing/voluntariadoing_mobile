import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voluntariadoing_mobile/authentication/cubits/authentication_cubit.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/common/widgets/api_error_message.dart';
import 'package:voluntariadoing_mobile/common/widgets/information_message.dart';
import 'package:voluntariadoing_mobile/common/widgets/labeled.dart';
import 'package:voluntariadoing_mobile/common/widgets/loading_text_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/section_title.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/volunteer/cubits/password_update_cubit.dart';
import 'package:voluntariadoing_mobile/volunteer/views/complete_profile/complete_profile_view.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key key,
  }) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile>
    with NavigatorMixin {
  PasswordUpdateCubit passwordUpdateCubit;
  //EditProfileCubit profileUpdateCubit;
  AuthenticationCubit authCubit;

  String currentPassword = '';

  String newPassword = '';

  String newPasswordConfirmation = '';

  void _onCurrentPasswordChanged(String value) => currentPassword = value;

  void _onNewPasswordChanged(String value) => newPassword = value;

  void _onNewPasswordConfirmationChanged(String value) {
    newPasswordConfirmation = value;
  }

  void _updatePassword() {
    if (newPassword != newPasswordConfirmation) {
      showDialog(
          context: context,
          child: InformationMessage(
            title: 'COMMON.ERROR'.tr(),
            content: 'AUTHENTICATION.PASSWORDS_DONT_MATCH'.tr(),
            buttonColor: ColorPalette.red,
          ));
      return;
    }
    final authenticationUser =
        (authCubit.state as AuthenticationSuccess).authenticationUser;
    final username = authenticationUser.username;
    passwordUpdateCubit?.updatePassword(username, currentPassword, newPassword);
  }

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthenticationCubit>(context);
    passwordUpdateCubit = PasswordUpdateCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => passwordUpdateCubit,
      child: BlocListener<PasswordUpdateCubit, PasswordUpdateState>(
        listener: (_, state) {
          if (state is PasswordUpdateSuccess) {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                title: new Text ("Password Changed"),
                  content: new Text("Congratulations! Your password has been changed"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Close me!"),
                      onPressed: (){
                      Navigator.of(context).pop();
            }
              )
                  ],
              )
            );
          } else if (state is PasswordUpdateFailure) {
            showDialog(
              context: context,
              child: ApiErrorMessage(error: state.error),
            );
          }
        },
        child: _buildView(),
      ),
    );
  }

  Widget _buildView() {
    return Scaffold(
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
                  description: 'AUTHENTICATION.UPDATE_PASSWORD_SUBTITLE'.tr()),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Labeled(
                  label: 'AUTHENTICATION.CURRENT_PASSWORD'.tr(),
                  child: RaisedTextInput(
                    hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                    obscureText: true,
                    onChanged: _onCurrentPasswordChanged,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Labeled(
                  label: 'AUTHENTICATION.NEW_PASSWORD'.tr(),
                  child: RaisedTextInput(
                    hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                    obscureText: true,
                    onChanged: _onNewPasswordChanged,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Labeled(
                  label: 'AUTHENTICATION.NEW_PASSWORD_CONFIRMATION'.tr(),
                  child: RaisedTextInput(
                    hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
                    obscureText: true,
                    onChanged: _onNewPasswordConfirmationChanged,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                child: BlocBuilder<PasswordUpdateCubit, PasswordUpdateState>(
                  builder: (_, state) {
                    return LoadingTextButton(
                      isLoading: state is PasswordUpdateLoading,
                      onTap: _updatePassword,
                      text: 'COMMON.CONFIRM'.tr(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}