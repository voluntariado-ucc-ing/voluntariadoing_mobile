import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/authentication/views/login_view.dart';
import 'package:voluntariadoing_mobile/authentication/views/new_password_view.dart';
import 'package:voluntariadoing_mobile/splash/views/splash_view.dart';

abstract class AppRoutes {

  static const splash = '/';
  static const login = '/authentication/login';
  static const newPassword = '/authentication/new_password';

  static final routes = {
    splash: (BuildContext ctx) => SplashView(),
    login: (BuildContext ctx) => LoginView(),
    newPassword: (BuildContext ctx) => NewPasswordView(),
  };
}