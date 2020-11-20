library config.global;
import 'package:flutter/material.dart';
import 'package:moove/themes/theme_controller.dart';

Color primaryColor = Colors.greenAccent;
Color shadowColor=Colors.grey;
Color textColor=Colors.white;
double textFontSize=36;
double defaultPadding=50.0; //Padding between the sections in the home screen
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
