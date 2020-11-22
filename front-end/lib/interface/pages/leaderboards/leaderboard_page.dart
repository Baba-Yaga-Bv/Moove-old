import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moove/domain/entities/user.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/communities/components/CommunityListElement.dart';
import 'package:moove/interface/pages/leaderboards/components/leaderboardPageBody.dart';
import 'package:moove/service/service.dart';
import 'package:moove/main.dart';

class LeaderboardPage extends StatefulWidget {
  CommunityListElement com;
  LeaderboardPage(this.com);
  @override
  State<StatefulWidget> createState() => LeaderboardPageState(com);
}

class LeaderboardPageState extends State<LeaderboardPage> {
  CommunityListElement com;
  LeaderboardPageState(this.com);

  @override
  Widget build(BuildContext context) {
    return LeaderboardBody(com);
  }
}
