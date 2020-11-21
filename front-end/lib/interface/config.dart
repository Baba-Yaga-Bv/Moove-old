library config.global;

import 'package:flutter/material.dart';
import 'package:moove/interface/pages/communities/communities_page.dart';
import 'package:moove/interface/pages/profile/profile_page.dart';
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
  accentColor: primaryColor,
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





// AppBars

//App bar for communities which has the specific button
AppBar buildCommunitiesBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pop(context);
        },
        iconSize: defaultIconSize,
      )
    ],
  );
}

//App bar with the app name for the auth pages

AppBar buildUserAuthBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        "M(.)(.)VE",
        style: mediumTextStyle,
      ),
    );
  }


//App bar Home page
AppBar buildHomeBar(BuildContext context) {
  return AppBar(
      elevation: 0,
      // Communities page button
      leading: IconButton(
        icon: Icon(Icons.menu_open),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommunitiesPage()
              )
          );
        },
        iconSize: 40,
      ),
      // Profile page button
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage()
                )
            );
          },
          iconSize: 40,
        )
      ]
  );
}

//Padding
double mediumPadding = 20;
double largePadding = 30;

