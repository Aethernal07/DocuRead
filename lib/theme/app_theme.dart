import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors - Light Mode (Glassmorphism with soft gradient base)
  static const Color primaryLight = Color(0xFF6366F1); // Indigo
  static const Color secondaryLight = Color(0xFFA855F7); // Purple
  static const Color accentLight = Color(0xFFEC4899); // Pink
  static const Color backgroundLight = Color(0xFFF1F5F9); // Slate-100
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color errorLight = Color(0xFFDC2626);
  static const Color successLight = Color(0xFF059669);

  // Glass colors for light theme
  static const Color glassFillLight = Color(0x66FFFFFF); // white 40%
  static const Color glassBorderLight = Color(0x99FFFFFF); // white 60%

  // Colors - Dark Mode
  static const Color primaryDark = Color(0xFF818CF8);
  static const Color secondaryDark = Color(0xFFC084FC);
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color errorDark = Color(0xFFEF4444);
  static const Color successDark = Color(0xFF10B981);

  // Glass colors for dark theme
  static const Color glassFillDark = Color(0x14FFFFFF); // white 8%
  static const Color glassBorderDark = Color(0x26FFFFFF); // white 15%

  // Light Theme - glassmorphism optimized
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primaryLight,
      secondary: secondaryLight,
      tertiary: accentLight,
      surface: surfaceLight,
      error: errorLight,
    ),
    scaffoldBackgroundColor: backgroundLight,
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: textPrimaryLight,
      displayColor: textPrimaryLight,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textPrimaryLight,
      ),
      iconTheme: const IconThemeData(color: textPrimaryLight),
    ),
    cardTheme: CardTheme(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      foregroundColor: Colors.white,
      elevation: 8,
    ),
  );

  // Dark Theme - glassmorphism optimized
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primaryDark,
      secondary: secondaryDark,
      surface: surfaceDark,
      error: errorDark,
    ),
    scaffoldBackgroundColor: backgroundDark,
    textTheme: GoogleFonts.interTextTheme().apply(
      bodyColor: textPrimaryDark,
      displayColor: textPrimaryDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textPrimaryDark,
      ),
      iconTheme: const IconThemeData(color: textPrimaryDark),
    ),
    cardTheme: CardTheme(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
      foregroundColor: backgroundDark,
      elevation: 8,
    ),
  );

  // Glass container widget helper
  static Widget glassContainer({
    required Widget child,
    required BuildContext context,
    double radius = 20,
    EdgeInsetsGeometry? padding,
    double blur = 20,
    Color? fillColor,
    Color? borderColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultFill = fillColor ?? (isDark ? glassFillDark : glassFillLight);
    final defaultBorder = borderColor ?? (isDark ? glassBorderDark : glassBorderLight);

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: defaultFill,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: defaultBorder, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0F000000),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
