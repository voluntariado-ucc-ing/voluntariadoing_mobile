import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voluntariadoing_mobile/authentication/cubits/authentication_cubit.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/volunteer/utils/volunteer_view_utils.dart';
import 'package:voluntariadoing_mobile/volunteer/views/login_view.dart';

class SplashView extends StatelessWidget with NavigatorMixin {
  Widget _buildCredentialsNotFoundView() => LoginView();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthenticationCubit>(context);
    cubit.getAuthenticationUser();
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      cubit: cubit,
      listener: (_, state) {
        Widget view;
        if (state is AuthenticationSuccess) {
          view = getAfterAuthenticationView(state.authenticationUser);
        } else {
          view = _buildCredentialsNotFoundView();
        }
        pushReplacement(context, view);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: PresentationLogo()),
      ),
    );
  }
}
