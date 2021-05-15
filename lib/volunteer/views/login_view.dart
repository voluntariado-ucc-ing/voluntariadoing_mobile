import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voluntariadoing_mobile/authentication/cubits/authentication_cubit.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/common/widgets/api_error_message.dart';
import 'package:voluntariadoing_mobile/common/widgets/loading_text_button.dart';
import 'package:voluntariadoing_mobile/common/widgets/no_overscroll_behavior.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/common/widgets/raised_text_input.dart';
import 'package:voluntariadoing_mobile/common/widgets/secondary_button.dart';
import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/volunteer/utils/volunteer_view_utils.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with NavigatorMixin {
  AuthenticationCubit cubit;

  String username = '';

  String password = '';

  void _onUsernameChanged(String value) => username = value;

  void _onPasswordChanged(String value) => password = value;

  void _login() => cubit.authenticate(username.trim(), password.trim());

  @override
  void initState() {
    cubit = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      cubit: cubit,
      listener: (_, state) {
        if (state is AuthenticationSuccess) {
          final view = getAfterAuthenticationView(state.authenticationUser);
          pushReplacement(context, view);
        } else if (state is AuthenticationFailure) {
          showDialog(
            context: context,
            child: ApiErrorMessage(error: state.error),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ScrollConfiguration(
            behavior: NoOverscrollBehavior(),
            child: ListView(
              shrinkWrap: true,
              children: [PresentationLogo(), _buildInputs()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputs() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'AUTHENTICATION.LOGIN'.tr(),
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: ColorPalette.darkerGrey,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.EMAIL_HINT'.tr(),
              onChanged: _onUsernameChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RaisedTextInput(
              hintText: 'AUTHENTICATION.PASSWORD_HINT'.tr(),
              obscureText: true,
              onChanged: _onPasswordChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              cubit: cubit,
              builder: (_, state) {
                final loading = state is AuthenticationLoading;
                return LoadingTextButton(
                  isLoading: loading,
                  onTap: _login,
                  text: 'AUTHENTICATION.LOGIN'.tr(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SecondaryButton(
              onTap: () {},
              text: 'AUTHENTICATION.FORGOT_PASSWORD'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
