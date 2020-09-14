import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/authentication/services/local_api_credentials_service.dart';
import 'package:voluntariadoing_mobile/common/mixins/navigator_mixin.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/donations/views/donations_view.dart';
import 'package:voluntariadoing_mobile/volunteer/views/login_view.dart';

class SplashView extends StatelessWidget with NavigatorMixin {
  final _localApiCredentialsService = LocalApiCredentialsService();

  Future<void> _checkAuthStatus(BuildContext ctx) async {
    final credentials = await _localApiCredentialsService.getCredentials();

    Widget view;
    if (credentials == null) {
      view = _buildLogin();
    } else {
      view = _buildDonations();
    }

    pushReplacement(ctx, view);
  }

  Widget _buildLogin() => LoginView();

  Widget _buildDonations() => DonationsView();

  @override
  Widget build(BuildContext context) {
    _checkAuthStatus(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: PresentationLogo()),
    );
  }
}
