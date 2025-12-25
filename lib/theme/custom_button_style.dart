
import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/theme/custom_box_decoration.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class CustomButtonStyles {

  static BoxDecoration get fillPrimaryTL12 =>
      BoxDecoration(
        color: appTheme.primary,
        borderRadius: CustomBorderRadiusStyle.border30,
      );

  static BoxDecoration get fillPrimaryGrayTL12 =>
      BoxDecoration(
        color: appTheme.primaryGray,
        borderRadius: CustomBorderRadiusStyle.border30,
      );

  static BoxDecoration get borderPrimaryTL12 =>
      BoxDecoration(
        color: appTheme.white,
        borderRadius: CustomBorderRadiusStyle.border30,
        border: Border.all(
          color: appTheme.primaryGray,
          width: 1.h,
        ),
      );
}
