import 'package:flutter/material.dart';

import '../../config.dart';
import 'components/communities_body.dart';

class CommunitiesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommunitiesPageState();
}

class CommunitiesPageState extends State<CommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommunitiesBar(context),
      body: CommunitiesBody()
    );
  }

  // AppBar buildCommunitiesBar() {
  //   return AppBar(
  //     automaticallyImplyLeading: false,
  //     elevation: 0,
  //
  //
  //     actions: [
  //       IconButton(
  //         icon: Icon(Icons.arrow_forward),
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         iconSize: defaultIconSize,
  //       )
  //     ],
  //   );


  }

