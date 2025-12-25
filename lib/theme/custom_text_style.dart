import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class CustomTextStyles {
  // Use Inter font by default from theme, so just use copyWith for specifics

  // Headers / Titles
  static TextStyle get headlineMedium =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black,
        fontSize: 24.fSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get titleMedium => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleSmall => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black,
    fontSize: 14.fSize,
    fontWeight: FontWeight.w500,
  );

  // Body Text
  static TextStyle get bodyLarge => theme.textTheme.bodyLarge!.copyWith(
    color: appTheme.textPrimary,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyMedium => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.textPrimary,
    fontSize: 14.fSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodySmall => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.textSecondary,
    fontSize: 12.fSize,
    fontWeight: FontWeight.w400,
  );

  // Button Text
  static TextStyle get labelLarge => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.white,
    fontSize: 16.fSize,
    fontWeight: FontWeight.w600,
  );

  // Specific Legacy/Custom ones that might be useful
  static TextStyle get logoText => theme.textTheme.headlineSmall!.copyWith(
    color: appTheme.primary,
    fontSize: 20.fSize,
    fontWeight: FontWeight.w600,
  );
}
