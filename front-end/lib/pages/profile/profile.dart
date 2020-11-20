import 'package:flutter/material.dart';

import '../../config.dart';
import 'components/profile_body.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileBar(),
      body: ProfileBody(),
    );
  }

  AppBar buildProfileBar() {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
          iconSize: defaultIconSize,
        )
      ],
    );
  }
}