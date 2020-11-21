library config.global;

import 'package:flutter/material.dart';
import 'package:moove/interface/themes/theme_controller.dart';

// Colors
Color primaryColor = Colors.deepOrange;
Color shadowColor = Colors.grey;
Color cardColor = Colors.black26;

// Themes
ThemeData lightTheme = ThemeData(
  accentColor: primaryColor,
  primaryColor: primaryColor,
  shadowColor: shadowColor,
  cardColor: cardColor,
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
double smallIconSize = 20;
double mediumIconSize = 30;
double defaultIconSize = 40;

// Blur
double defaultBlurRadius = 30;

// Text
TextStyle superSmallTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 14,
);
TextStyle smallTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 20,
);
TextStyle mediumTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 30,
);
TextStyle largeTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 40,
);

// Padding
double mediumPadding = 20;
double largePadding = 30;
