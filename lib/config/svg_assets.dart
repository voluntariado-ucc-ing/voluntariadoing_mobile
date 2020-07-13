import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

abstract class SvgAssets {

  static final logo = 'assets/images/splash/illustration.svg';
  static final donationToBeConfirmed = 'assets/images/donations/to_be_confirmed.svg';
  static final donationToBeRetrieved = 'assets/images/donations/to_be_retrieved.svg';
  static final donationRetrieved = 'assets/images/donations/retrieved.svg';
  static final donationRejected = 'assets/images/donations/rejected.svg';
  
  /// Precaching assets that need to be available as soon as the app starts
  static prealoadSvgAssets() async {
    await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, logo),
      null,
    );
  }

}