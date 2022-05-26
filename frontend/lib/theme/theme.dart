import 'package:flutter/material.dart';

// extension ThemeDataColorScheme on ThemeData {
//   ColorScheme get colorScheme => AppTheme.darkColorScheme;

// }

class AppTheme {
  static ColorScheme lightColorScheme = ColorScheme(
    background: Colors.white,
    primary: Colors.blueAccent,
    accent: Colors.amberAccent,
    text: Colors.black,
  );
  static ColorScheme darkColorScheme = ColorScheme(
    background: Colors.white,
    primary: Colors.blueAccent,
    accent: Colors.amberAccent,
    text: Colors.black,
  );

  static ThemeData _themeData(ColorScheme scheme) {
    return ThemeData(
      primaryColor: scheme.primary,
      backgroundColor: scheme.background,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: scheme.text,
          height: 1.3,
        ),
        headline2: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: scheme.text,
          height: 1.3,
        ),
        headline3: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: scheme.text,
          height: 1.3,
        ),
        headline4: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: scheme.text,
          height: 1.3,
        ),
        headline5: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: scheme.text,
          height: 1.3,
        ),
        headline6: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: scheme.text,
          height: 1.4,
        ),
        subtitle1: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: scheme.text,
          height: 1.3,
        ),
        subtitle2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: scheme.text,
          height: 1.2,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: scheme.text,
          height: 1.3,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: scheme.text,
          height: 1.2,
        ),
        caption: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: Color(0xFF8c98a8),
          height: 1.7,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return _themeData(lightColorScheme);
  }

  static ThemeData get darkTheme {
    return _themeData(darkColorScheme);
  }
}

class ColorScheme {
  final Color background;
  final Color primary;
  final Color accent;
  final Color text;
  ColorScheme({
    required this.background,
    required this.primary,
    required this.accent,
    required this.text,
  });
}
