

import 'package:flutter/material.dart';
import 'package:moove/interface/pages/communities/communities_page.dart';
import 'package:moove/interface/pages/profile/profile_page.dart';
import '../../config.dart';
import 'components/user_login_body.dart';
import 'components/user_sign_in_body.dart';

class UserAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserAuthPageState();
}

class UserAuthPageState extends State<UserAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildUserAuthBar(),
      body: UserAuthSignInBody(),
      // Theme switching button

    );
  }
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
}