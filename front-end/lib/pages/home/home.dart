import 'package:flutter/material.dart';
import 'package:moove/config.dart';

import 'components/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeBar(),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            themeController.switchTheme();
          },
          label: Text("Switch theme"),
          icon: Icon(Icons.brightness_5)),
    );
  }

  AppBar buildHomeBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu_open),
        onPressed: () {},
        iconSize: 40,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
          iconSize: 40,
        )
      ]
    );
  }
}
