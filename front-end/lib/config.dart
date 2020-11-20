library config.global;
import 'package:flutter/material.dart';
import 'package:moove/themes/theme_controller.dart';

Color primaryColor = Colors.greenAccent;

ThemeData lightTheme = ThemeData(
  accentColor: primaryColor,
  primaryColor: primaryColor,
  appBarTheme: AppBarTheme(
    color: primaryColor
  )
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: primaryColor
);
ThemeController themeController = ThemeController();
<<<<<<< Updated upstream
=======

Radius defaultRoundedCorner = Radius.circular(40);
>>>>>>> Stashed changes
