import 'package:flutter/material.dart';

class TodoTheme {
  TodoTheme();

  ThemeData get themeData {
    Color primary = const Color(0xffE7EAED);
    Color secondary = const Color(0xffEDEEF0);

    Color darkPrimary = const Color(0xff6D6C71);
    ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: darkPrimary,
      secondary: secondary,
      onSecondary: darkPrimary,
      error: Colors.red,
      onError: primary,
      background: primary,
      onBackground: darkPrimary,
      surface: secondary,
      onSurface: darkPrimary,
    );
    return ThemeData.from(colorScheme: colorScheme);
  }
}
