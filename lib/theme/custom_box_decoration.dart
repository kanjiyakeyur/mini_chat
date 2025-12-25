import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class CustomBoxDecoration {
  static BoxDecoration get screenBackground =>
      BoxDecoration(color: appTheme.background);

  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.lightGray,
    borderRadius: CustomBorderRadiusStyle.border30,
  );

  static BoxDecoration get fillPrimary =>
      BoxDecoration(color: appTheme.primary);

  static BoxDecoration get fillPrimaryB10 => BoxDecoration(
    color: appTheme.primary,
    borderRadius: CustomBorderRadiusStyle.border10,
  );

  static BoxDecoration get fillGrayB10 => BoxDecoration(
    color: appTheme.lightGray,
    borderRadius: CustomBorderRadiusStyle.border10,
  );

  static BoxDecoration get fillPrimaryB50 => BoxDecoration(
    color: appTheme.primary,
    borderRadius: CustomBorderRadiusStyle.border50,
  );

  static BoxDecoration get borderGrayB10 => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.border10,
    border: Border.all(color: appTheme.lightGray, width: 1.h),
  );

  static BoxDecoration get borderGrayB50 => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.border50,
    border: Border.all(color: appTheme.lightGray, width: 1.h),
  );

  static BoxDecoration get borderWhiteB50 => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.border50,
    border: Border.all(color: appTheme.white, width: 1.h),
  );

  static BoxDecoration get borderPrimaryWithLightB50 => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.border50,
    border: Border.all(color: appTheme.primary, width: 1.h),
    color: appTheme.primary.withOpacity(0.1),
  );

  static BoxDecoration get userChatBubble => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.userChatBubble,
    color: appTheme.primary,
  );

  static BoxDecoration get friendChatBubble => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.aiChatBubble,
    color: appTheme.lightGray, // or white depending on design
  );

  static BoxDecoration get userFileChatBubble => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.userChatBubble,
    color: appTheme.primary.withOpacity(0.1),
    border: Border.all(color: appTheme.primary, width: 1.h),
  );

  static BoxDecoration get primaryLightWithBorder => BoxDecoration(
    borderRadius: CustomBorderRadiusStyle.border10,
    // color: appTheme.primaryLight,
    border: Border.all(color: appTheme.primary, width: 1.h),
  );

  static BoxDecoration get topShadow => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: appTheme.background,
        blurRadius: 18,
        offset: Offset(0, -14),
      ),
    ],
  );

  static BoxDecoration get bottomShadow => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: appTheme.background,
        blurRadius: 4,
        offset: Offset(0, 8),
      ),
    ],
  );

  // Weather-specific decorations
  static BoxDecoration get weatherCard => BoxDecoration(
    color: appTheme.white,
    borderRadius: CustomBorderRadiusStyle.border10,
    boxShadow: [
      BoxShadow(
        color: appTheme.black.withOpacity(0.1),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );
}

class CustomBorderRadiusStyle {
  static BorderRadius get border30 => BorderRadius.circular(30.h);

  static BorderRadius get border10 => BorderRadius.circular(10.h);

  static BorderRadius get border50 => BorderRadius.circular(50.h);

  static BorderRadius get borderT10 => BorderRadius.only(
    topLeft: Radius.circular(10.h),
    topRight: Radius.circular(10.h),
  );

  static BorderRadius get userChatBubble => BorderRadius.only(
    topLeft: Radius.circular(10.h),
    topRight: Radius.circular(10.h),
    bottomLeft: Radius.circular(10.h),
  );

  static BorderRadius get aiChatBubble => BorderRadius.only(
    topLeft: Radius.circular(10.h),
    topRight: Radius.circular(10.h),
    bottomRight: Radius.circular(10.h),
  );
}
