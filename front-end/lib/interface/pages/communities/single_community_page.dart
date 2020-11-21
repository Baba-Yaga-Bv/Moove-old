import 'package:flutter/material.dart';

import '../../config.dart';
import 'components/CommunityListElement.dart';
import 'components/communities_body.dart';
import 'components/single_community_body.dart';

class SingleCommunityPage extends StatefulWidget {

  CommunityListElement com;
  SingleCommunityPage(this.com);

  @override
  State<StatefulWidget> createState() => SingleCommunityPageState(com);


}


class SingleCommunityPageState extends State<SingleCommunityPage> {

  CommunityListElement com;
  SingleCommunityPageState(this.com);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildSingleCommunityBar(com),
        body: SingleCommunityBody(com)
    );
  }


}

