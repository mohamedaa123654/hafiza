import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color_manager.dart';
import 'font_manager.dart';

class Style {
  TextStyle logoTitleForAppBarStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: ColorManager.white,
      fontSize: 8.sp,
      height: 1.2);

  TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );

  TextStyle headerStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 10.sp,
  );
}

TextStyle homeBtTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: ColorManager.primary,
  fontSize: 11.sp,
);
TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
    fontSize: 18.sp,
    height: 1.2);

///About Us Style
TextStyle aboutUsTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorManager.white,
    fontSize: 16.sp,
    height: 1.2);
TextStyle bodyLogoTitleStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorManager.white,
    fontSize: 18.sp,
    height: 1.2);
TextStyle bodyLogoTitleEnStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: ColorManager.white,
    fontSize: 14.sp,
    height: 1.2);
TextStyle bodyTextStyle = TextStyle(
    // fontWeight: FontWeight.w200,
    color: ColorManager.black,
    fontSize: 14.sp,
    height: 1.2);

///Contact Us Style
TextStyle contactUsTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorManager.primary,
    fontSize: 14.sp,
    height: 1.2);

TextStyle contactUsSubmitButtomStyle = TextStyle(
    fontWeight: FontWeight.w100,
    color: ColorManager.white,
    fontSize: 10.sp,
    height: 1.2);
TextStyle contactUsFooterStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorManager.black,
    fontSize: 10.sp,
    height: 1.2);
TextStyle contactUsWarningText =
    TextStyle(color: ColorManager.red, fontSize: 8.sp, height: 1.2);

///Our Products Style
TextStyle ourProductBodyStyle =
    TextStyle(color: ColorManager.primary, fontSize: 16.sp, height: 1.2);

///Our Branch Style

TextStyle ourBranchCardTitleStyle = TextStyle(
    // fontWeight: FontWeight.w200,
    color: ColorManager.black,
    fontSize: 10.sp,
    height: 1.2);
TextStyle ourBranchCardAdressStyle = TextStyle(
    // fontWeight: FontWeight.w200,
    color: ColorManager.black,
    fontSize: 8.sp,
    height: 1.2);
TextStyle ourBranchCardAddressStyle = TextStyle(
    fontWeight: FontWeight.w200,
    color: ColorManager.black,
    fontSize: 7.sp,
    height: 1.2);

TextStyle ourBranchCardMapStyle = TextStyle(
    // fontWeight: FontWeight.w600,
    color: ColorManager.openOnMapColor,
    fontSize: 9.sp,
    height: 1.2);

///Location Style

TextStyle locationBtTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: ColorManager.white,
  fontSize: 11.sp,
);

///Medical network style
TextStyle medicalnNetworkCardStyle = TextStyle(
    fontWeight: FontWeight.w200,
    color: ColorManager.white,
    fontSize: 7.sp,
    height: 1.2);

TextStyle medicalnNetworkTitleStyle = TextStyle(
    // fontWeight: FontWeight.w800,
    color: ColorManager.primary,
    fontSize: 16.sp,
    height: 1.2);

TextStyle medicalnNetworkDialogStyle =
    TextStyle(fontWeight: FontWeight.w200, fontSize: 12.sp, height: 1.2);

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      // height: height,

      fontWeight: fontWeight);
}

// regular style

TextStyle getTitleStyle({
  double fontSize = 32,
}) {
  return _getTextStyle(
      fontSize, FontWeightManager.regular, ColorManager.textColor);
}

// medium style

TextStyle getRegularStyle({double fontSize = FontSize.s12, Color? color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color!);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

Decoration containerStyle(Color color) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.25),
          blurRadius: 1,
          spreadRadius: 1,
          offset: const Offset(1, 1), // changes position of shadow
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.25),
          blurRadius: 1,
          spreadRadius: 1,
          offset: const Offset(-1, 1), // changes position of shadow
        ),
      ],
      color: color);
}
