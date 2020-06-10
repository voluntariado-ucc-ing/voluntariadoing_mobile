import 'package:flutter/material.dart';
import 'package:voluntariadoing_mobile/authentication/views/login_view.dart';
import 'package:voluntariadoing_mobile/splash/views/splash_view.dart';

abstract class AppRoutes {

  static const splash = '/';
  static const login = '/login';

  static final routes = {
    splash: (BuildContext ctx) => SplashView(),
    login: (BuildContext ctx) => LoginView()
  };
}