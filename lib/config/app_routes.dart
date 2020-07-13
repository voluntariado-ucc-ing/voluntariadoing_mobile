import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/authentication/views/complete_profile/complete_profile_view.dart';
import 'package:voluntariadoing_mobile/authentication/views/login_view.dart';
import 'package:voluntariadoing_mobile/authentication/views/new_password_first_time_view.dart';
import 'package:voluntariadoing_mobile/authentication/views/new_password_view.dart';
import 'package:voluntariadoing_mobile/splash/views/splash_view.dart';

abstract class AppRoutes {

  static const splash = '/';
  static const login = '/authentication/login';
  static const newPassword = '/authentication/new_password';
  static const newPasswordFirstTime = '/authentication/new_password_first_time';
  static const completeProfile = '/authentication/complete_profile';

  static final routes = {
    splash: (BuildContext ctx) => SplashView(),
    login: (BuildContext ctx) => LoginView(),
    newPassword: (BuildContext ctx) => NewPasswordView(),
    newPasswordFirstTime: (BuildContext ctx) => NewPasswordFirstTimeView(),
    completeProfile: (BuildContext ctx) => CompleteProfileView()
  };
}