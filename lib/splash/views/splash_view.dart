import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/common/widgets/presentation_logo.dart';
import 'package:voluntariadoing_mobile/config/app_routes.dart';

class SplashView extends StatelessWidget {

  Future<void> _checkAuthStatus(BuildContext ctx) {
    return Future.delayed(Duration(seconds: 3), 
      () => Navigator.of(ctx).pushReplacementNamed(AppRoutes.login));
  }
  
  @override
  Widget build(BuildContext context) {

    _checkAuthStatus(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PresentationLogo()
      ),
    );
  }
}