import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:voluntariadoing_mobile/config/color_palette.dart';
import 'package:voluntariadoing_mobile/config/svg_assets.dart';
import 'package:voluntariadoing_mobile/splash/views/splash_view.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SvgAssets.prealoadSvgAssets();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(.7),
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark
    )
  );
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('es')],
      path: 'assets/translations',
      fallbackLocale: Locale('es'),
      child: App()
    )
  );
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      onGenerateTitle: (_) => 'APP.TITLE'.tr(),
      theme: ThemeData(
        cursorColor: ColorPalette.primaryBlue,
        primaryColor: ColorPalette.primaryBlue,
        colorScheme: ColorScheme.light(primary: ColorPalette.primaryBlue),
        textTheme: GoogleFonts.nunitoTextTheme(textTheme).copyWith(
          headline4: GoogleFonts.nunito(textStyle: textTheme.headline4.copyWith(fontWeight: FontWeight.w900)),
          headline5: GoogleFonts.nunito(textStyle: textTheme.headline5.copyWith(fontWeight: FontWeight.w900)),
          headline6: GoogleFonts.nunito(textStyle: textTheme.headline6.copyWith(fontWeight: FontWeight.w900))
        )
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashView(),
    );
  }

}