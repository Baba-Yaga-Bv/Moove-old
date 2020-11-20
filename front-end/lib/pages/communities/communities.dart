import 'package:flutter/material.dart';
import 'package:moove/pages/home/home.dart';

import 'components/communities_body.dart';

class CommunitiesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommunitiesPageState();
}

class CommunitiesPageState extends State<CommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommunitiesBody()
    );
  }

}