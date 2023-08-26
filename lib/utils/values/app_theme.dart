import 'package:flutter/material.dart';

import 'values.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: const IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.background,
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.black,
        selectionColor: AppColors.textSelectionColor,
        selectionHandleColor: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      hintColor: colorScheme.primary,
      focusColor: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    background: AppColors.primaryColor,
    surface: AppColors.primaryColor,
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_96,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_60,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      // Removed GoogleFonts.roboto here
      fontSize: Sizes.TEXT_SIZE_48,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_34,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      // Removed GoogleFonts.roboto here
      fontSize: Sizes.TEXT_SIZE_24,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      // Removed GoogleFonts.roboto here
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: TextStyle(
      // Removed GoogleFonts.roboto here
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      // Removed GoogleFonts.roboto here
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: _medium,
    ),
    caption: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.white,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}
