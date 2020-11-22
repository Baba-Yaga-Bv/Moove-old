import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/profile/settings/components/settings_body.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildSettingsBar(),
        body: SettingsBody(),
        // Theme switching button
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              themeController.switchTheme();
            },
            label: Text("Switch theme"),
            icon: Icon(Icons.brightness_5)));
  }

  AppBar buildSettingsBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text("Settings", style: smallTextStyle),
      actions: [
        IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: defaultIconSize,
        )
      ],
    );
  }
}
