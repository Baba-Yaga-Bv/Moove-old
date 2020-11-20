import 'package:flutter/material.dart';
import 'package:moove/pages/home/home.dart';
import 'config.dart';

void main() {
  runApp(MooveApp());
}

class MooveApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MooveAppState();
}

class MooveAppState extends State<MooveApp> {
  @override
  void initState() {
    super.initState();
    themeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Moove!",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeController.currentTheme(),
        home: HomePage()
    );
  }
}
