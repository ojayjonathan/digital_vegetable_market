import 'package:flutter/material.dart';

class AppTheme {
  static AppColorScheme lightColorScheme = const AppColorScheme.light();
  static AppColorScheme darkColorScheme = const AppColorScheme.dark();
  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 10,
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      borderSide: BorderSide(
        color: lightTheme.primaryColor,
        width: 0.0,
      ),
    ),
  );
  static ThemeData _themeData(AppColorScheme scheme) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.background,
        foregroundColor: scheme.text,
        elevation: 2,
      ),
      primarySwatch: Colors.green,
      iconTheme: IconThemeData(color: scheme.iconColor),
      colorScheme: scheme,
      primaryColor: scheme.primary,
      primaryColorLight: scheme.primaryColorLight,
      backgroundColor: scheme.background,
      shadowColor: scheme.shadow,
      primaryColorDark: scheme.primaryDarkLight,
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
          color: scheme.subtitleText,
          height: 1.3,
        ),
        subtitle2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: scheme.subtitleText,
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
  final Color accent = const Color(0xff20ABFA);
  final Color text;
  final Color subtitleText;
  final Color primaryColorLight = const Color(0xff5EB087);
  final Color primaryDarkLight = const Color(0xff3B6657);

  final Color iconColor;

  const AppColorScheme.light({
    this.subtitleText = const Color(0xff8C8D8D),
    this.text = Colors.black,
    this.iconColor = const Color(0xff807A7A),
  }) : super.light(
          primary: const Color(0xff58A37E),
          outline: const Color(0xffE4DFDF),
          secondary: const Color(0xffD9D9D9),
          shadow: const Color.fromARGB(33, 149, 157, 165),
        );

  const AppColorScheme.dark({
    this.subtitleText = Colors.white60,
    this.text = Colors.white,
    this.iconColor = const Color(0xff807A7A),
  }) : super.dark(
          primary: const Color(0xff53D2FB),
        );
}
