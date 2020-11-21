import 'package:flutter/material.dart';

import '../../config.dart';

import 'components/user_sign_up_body.dart';

class UserAuthSignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserAuthSignInPageState();
}

class UserAuthSignInPageState extends State<UserAuthSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildUserAuthBar(),
      body: UserAuthSignUpBody(),
      // Theme switching button
    );
  }

  AppBar buildUserAuthBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        "M(.)(.)VE!",
        style: mediumTextStyle,
      ),
    );
  }
}
