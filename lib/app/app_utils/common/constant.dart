import 'package:flutter/material.dart';

class ConstantData {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;
  static double getPercentSize(double total, double percent) {
    return (total * percent) / 100;
  }
  static String privacyPolicy = "https://bidvest.co.za";
  static String fontFamily = "Quicksand";
  static String font1 = "Quicksand";
  static String font2 = "Quicksand_Bold.otf";
  static String assetsIconPath = "assets/icon/";
  static String assetsImgPath = "assets/img/";
  static const double avatarRadius = 40;
  static double font15Px = ConstantData.safeBlockVertical! / 0.6;
  static double font12Px = ConstantData.safeBlockVertical! / 0.75;
  static double font18Px = ConstantData.safeBlockVertical! / 0.5;
  static double font22Px = ConstantData.safeBlockVertical! / 0.4;
  static double font25Px = ConstantData.safeBlockVertical! / 0.3;
  static const double padding = 20;
  static String dateFormat = "EEE ,MMM dd,yyyy";
  static String timeFormat = "hh:mm aa";

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = (screenWidth!/100);
    blockSizeVertical = (screenHeight!/100);
    _safeAreaHorizontal = _mediaQueryData!.padding.left +
        _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top +
        _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!)/100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!)/100;

  }

  static double getScreenPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.height * percent) / 100;
  }

  static double getWidthPercentSize(BuildContext context, double percent) {
    return (MediaQuery.of(context).size.width * percent) / 100;
  }

  static Widget getSpace(double space) {
    return SizedBox(
      height: space,
    );
  }

}


