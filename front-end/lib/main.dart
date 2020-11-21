import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/user_auth/user_auth_page_login.dart';
import 'package:moove/service/service.dart';
import 'package:moove/utils/pedometer.dart';

Service service = Service();

MoovePedometer moovePedometer = MoovePedometer();

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
    moovePedometer.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Moove!",
        debugShowCheckedModeBanner: false,
        // Set themes
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeController.currentTheme(),
        // Start on log in
        home: UserAuthLogin());
  }
}
