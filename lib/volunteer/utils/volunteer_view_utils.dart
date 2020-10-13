import 'package:flutter/widgets.dart';
import 'package:voluntariadoing_mobile/authentication/models/authentication_user.dart';
import 'package:voluntariadoing_mobile/donations/views/donations_view.dart';
import 'package:voluntariadoing_mobile/volunteer/views/new_password_first_time_view.dart';

Widget getAfterAuthenticationView(AuthenticationUser authenticationUser) {
  if (authenticationUser.alreadyLoggedIn) {
    return DonationsView();
  }
  return NewPasswordFirstTimeView();
}
