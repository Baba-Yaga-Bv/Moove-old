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
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
        iconSize: defaultIconSize,
      ),
      title: Text(
        "Profile",
        style: smallTextStyle,
        textAlign: TextAlign.center
      ),
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