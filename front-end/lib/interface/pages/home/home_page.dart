import 'package:flutter/material.dart';
import 'package:moove/interface/pages/communities/communities_page.dart';
import 'package:moove/interface/pages/profile/profile_page.dart';

import '../../config.dart';
import 'components/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeBar(context),
      body: HomeBody(),
      // Theme switching button
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            themeController.switchTheme();
          },
          label: Text("Switch theme"),
          icon: Icon(Icons.brightness_5)),
    );
  }

  // AppBar buildHomeBar() {
  //   return AppBar(
  //     elevation: 0,
  //     // Communities page button
  //     leading: IconButton(
  //       icon: Icon(Icons.menu_open),
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => CommunitiesPage()
  //           )
  //         );
  //       },
  //       iconSize: 40,
  //     ),
  //     // Profile page button
  //     actions: [
  //       IconButton(
  //         icon: Icon(Icons.person),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => ProfilePage()
  //             )
  //           );
  //         },
  //         iconSize: 40,
  //       )
  //     ]
  //   );
  // }
}
