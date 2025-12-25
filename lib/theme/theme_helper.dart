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
      scaffoldBackgroundColor: appTheme.background,
      useMaterial3: true,
      fontFamily:
          'Inter', // Assuming Inter or system default, can be removed if not needed
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xFF448AFF), // BlueAccent
    onPrimary: Colors.white,
    secondary: Color(0xFF448AFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF2A2D26),
    error: Color(0xFFD32F2F),
  );
}

class LightCodeColors {
  // Brand Colors
  Color get primary => Color(0xFF448AFF); // BlueAccent
  Color get primaryDark => Color(0xFF2979FF); // BlueAccent 400

  // Neutrals
  Color get white => Color(0xFFFFFFFF);
  Color get black => Color(0xFF2A2D26); // Dark Charcoal
  Color get background => Color(0xFFF8FAFF); // Light Blue-ish Gray
  Color get gray => Color(0xFF9E9E9E);
  Color get lightGray => Color(0xFFE0E0E0);

  // Specific UI Colors (can be refactored later if strictly adhering to Scheme)
  Color get iconGray => Color(0xFFC4CDE0);
  Color get textPrimary => Color(0xFF2A2D26);
  Color get textSecondary => Color(0xFF757575);

  // Gradient Colors
  Color get gradientStart => Color(0xFF5B82F9); // Blue
  Color get gradientEnd => Color(0xFFB55BF9); // Purple
}
