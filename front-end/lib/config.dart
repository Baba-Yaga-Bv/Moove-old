library config.global;
import 'package:flutter/material.dart';
import 'package:moove/themes/theme_controller.dart';

// Colors
Color primaryColor = Colors.greenAccent;
Color shadowColor=Colors.grey;

// Themes
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

// Decorators
Radius defaultRoundedCorner = Radius.circular(40);

// Icons
double defaultIconSize = 40;

// Blur
double defaultBlurRadius = 30;

// Text
TextStyle mediumTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 30,
);

// Padding
double mediumPadding = 20;
