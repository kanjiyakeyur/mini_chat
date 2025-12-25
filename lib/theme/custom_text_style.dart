
import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/theme/theme_helper.dart';


class CustomTextStyles {

  static TextStyle get _mainFontFamily => TextStyle().copyWith(
    color: appTheme.primary,
    fontSize: 10.fSize,
    fontWeight: FontWeight.w500, // Medium
  );

  static TextStyle get buttonWhite => _mainFontFamily.copyWith(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
    color: appTheme.white,
  );

  static TextStyle get buttonPrimary => _mainFontFamily.copyWith(
    fontSize: 18.fSize,
    fontWeight: FontWeight.w600,
    color: appTheme.primary,
  );

  static TextStyle get bodyText => _mainFontFamily.copyWith(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.black,
  );

  // logo
  static TextStyle get logoText => _mainFontFamily.copyWith(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w500, // Bold
    color: appTheme.primary,
  );

  // onboarding Title
  static TextStyle get blackS28W600 => _mainFontFamily.copyWith(
    fontSize: 28.fSize,
    fontWeight: FontWeight.w600, // Semi-Bold
    color: appTheme.black,
  );

  static get blackS24W500 => _mainFontFamily.copyWith(
    fontSize: 24.fSize,
    fontWeight: FontWeight.w500,
    color: appTheme.black,
  );

  static get blackS24W600 => _mainFontFamily.copyWith(
    fontSize: 24.fSize,
    fontWeight: FontWeight.w600,
    color: appTheme.black,
  );

  // 10
  static get blackS10W300 => _mainFontFamily.copyWith(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w300,
    color: appTheme.black,
  );

  static get primaryS10W500 => _mainFontFamily.copyWith(
    fontSize: 6.fSize,
    fontWeight: FontWeight.w500,
    color: appTheme.primary,
  );

  // 14
  static get blackS14W600 => _mainFontFamily.copyWith(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.black,
  );

  // 16
  static get blackS16W400 => _mainFontFamily.copyWith(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w400,
    color: appTheme.black,
  );

  static get blackS16W600 => _mainFontFamily.copyWith(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
    color: appTheme.black,
  );

}
