// Flutter imports:
import 'package:flutter/material.dart';



LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  LightCodeColors _getThemeColors() {
    return LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    //primary: Color(0XFF5B82F9), //Blue
    primary: Color(0XFFBA7041),
    //Blue
    primaryContainer: Color(0XFF242424),
    //Black
    errorContainer: Color(0X3F000000),
    onError: Color(0XCC34A853),
    onErrorContainer: Color(0XFF2F2F2F),
    onPrimary: Color(0X66141414),
    onPrimaryContainer: Color(0XCCFDC868),
  );
}


class LightCodeColors {
  Color get primary => Color(0XFFBA7041);
  Color get primaryGray => Color(0XFFD7CFBA);
  Color get primaryLight => Color(0XFFFFF0E6);

  Color get background => Color(0XFFFFF9F5);

  Color get white => Color(0XFFFFF9F5);
  Color get black => Color(0XFF2A2D26);
  Color get gray => Color(0XFF2A2C27);
  Color get lightGray => Color(0XFFD3D3D3);

  Color get gradient1 => Color(0XFFF3E0D5);
  Color get gradient2 => Color(0XFFFFF9F5);

  Color get redA200 => Color(0XFFF95B5B);
  Color get brown => Color(0XFF835D3C);

  Color get redA700 => Color(0XFFFF0000);
  Color get homeBg => Color(0XFFFAF9FA).withValues(alpha: 0.98);
  Color get iconBg => theme.colorScheme.primary.withValues(alpha: 0.06);
}
