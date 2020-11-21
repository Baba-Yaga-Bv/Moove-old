import 'package:flutter/material.dart';

import '../../config.dart';
import 'components/CommunityListElement.dart';
import 'components/communities_body.dart';
import 'components/single_community_body.dart';

class SingleCommunityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SingleCommunityPageState();
}

class SingleCommunityPageState extends State<SingleCommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildSingleCommunityBar(new CommunityListElement("Placeholder", AssetImage("assets/pictures/placeholder.jpg"))),
        body: SingleCommunityBody()
    );
  }
}

