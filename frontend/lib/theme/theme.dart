import 'package:flutter/material.dart';

extension ThemeDataColorScheme on ThemeData {
  AppColorScheme get getColorscheme => colorScheme as AppColorScheme;
}

class AppTheme {
  static AppColorScheme lightColorScheme = const AppColorScheme.light(
    background: Colors.white,
    primary: Colors.blueAccent,
    accent: Colors.amberAccent,
    text: Colors.black,
  );
  static AppColorScheme darkColorScheme = const AppColorScheme.dark(
    background: Colors.white,
    primary: Colors.blueAccent,
    accent: Colors.amberAccent,
    text: Colors.black,
  );
  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: lightTheme.primaryColor, width: 0.0),
    ),
  );
  static ThemeData _themeData(AppColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
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

class AppColorScheme extends ColorScheme {
  final Color accent;
  final Color text;
  const AppColorScheme.light({
    required background,
    required primary,
    required this.accent,
    this.text = Colors.black,
  }) : super.light(background: background, primary: primary);

  const AppColorScheme.dark({
    required background,
    required primary,
    required this.accent,
    this.text = Colors.white,
  }) : super.dark(background: background, primary: primary);
}
