library config.global;
import 'package:flutter/material.dart';
import 'package:moove/themes/theme_controller.dart';

Color primaryColor = Colors.greenAccent;
Color shadowColor=Colors.grey;
ThemeData lightTheme = ThemeData(
  accentColor: primaryColor,
  primaryColor: primaryColor,
  shadowColor: shadowColor,
  appBarTheme: AppBarTheme(
    color: primaryColor
  )
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: primaryColor
);
ThemeController themeController = ThemeController();

Radius defaultRoundedCorner = Radius.circular(40);
