import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

abstract class SvgAssets {

  static final logo = 'assets/images/splash/illustration.svg';
  
  static prealoadSvgAssets() async {
    await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, logo),
      null,
    );
  }

}