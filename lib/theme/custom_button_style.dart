import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/theme/custom_box_decoration.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class CustomButtonStyles {
  static BoxDecoration get fillPrimaryTL12 => BoxDecoration(
    color: appTheme.primary,
    borderRadius: CustomBorderRadiusStyle.border30,
  );

  static BoxDecoration get fillGrayTL12 => BoxDecoration(
    color: appTheme.lightGray,
    borderRadius: CustomBorderRadiusStyle.border30,
  );

  static BoxDecoration get outlinePrimaryTL12 => BoxDecoration(
    color: appTheme.white,
    borderRadius: CustomBorderRadiusStyle.border30,
    border: Border.all(color: appTheme.lightGray, width: 1.h),
  );
}
