import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/authentication/views/login_view.dart';
import 'package:voluntariadoing_mobile/splash/views/splash_view.dart';
import 'package:voluntariadoing_mobile/user/views/new_password.dart';

abstract class AppRoutes {

  static const splash = '/';
  static const login = '/login';
  static const password = '/user/new_password';

  static final routes = {
    splash: (BuildContext ctx) => SplashView(),
    login: (BuildContext ctx) => LoginView(),
    password: (BuildContext ctx) => NewPasswordPage(),
  };
}