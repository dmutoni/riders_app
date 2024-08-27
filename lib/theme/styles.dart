import 'package:flutter/material.dart';
import 'package:riders_app/values/colors.dart';

abstract class Styles {
  static const _poppins = 'Poppins';

  static const TextStyle errorTextStyleRed = TextStyle(
    fontFamily: _poppins,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 14.0 / 10.0,
    color: ThemeColors.darkRed,
  );

  static const TextStyle errorTextStyleWhite = TextStyle(
    fontFamily: _poppins,
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    height: 14.0 / 10.0,
    color: ThemeColors.white,
  );

  static const TextStyle h6HeadingWhite = TextStyle(
    fontFamily: _poppins,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: ThemeColors.white,
    // height: 14.0 / 14.0,
  );

  static const TextStyle h6HeadingBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: ThemeColors.black,
    height: 16.0 / 14.0,
  );

  static const TextStyle inputLabelStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: ThemeColors.white,
  );

  static const TextStyle bottomNavigationBarStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: ThemeColors.black,
  );
}
