import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = const Color(0xffd2a57c);
  static Color darkPrimary = const Color(0xff755743);
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xffF2F2F2);
  static Color grey2 = const Color(0xffF3F3F3);
  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffFFFFFF);
  static Color goldenBtColor = const Color(0xffA48A01);
  static Color goldenBtShadowColor = const Color(0xff645302);
  static Color bgColor = const Color(0xfffffef3);

  static Color textColor = const Color(0xffFFFFFF);
  static Color textBlueColor = const Color(0xff4698E5);

  static Color shadowColor = const Color(0xff306CD5);
  static Color containerLightPrimary = const Color(0xffdad4d1);
  static Color homeBtColor = const Color(0xffECECEC);
  static Color homeBtTextColor = const Color(0xff8EB2E3);
  static Color logoTextColor = const Color(0xff262973);
  static Color downloadBtColor = const Color(0xffF4F5F9);
  static Color openOnMapColor = const Color(0xff4C9FEE);
  static Color red = const Color(0xffea455b);
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
