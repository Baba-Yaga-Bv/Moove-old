import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/communities/components/CommunityListElement.dart';
import 'package:moove/service/service.dart';


class LeaderboardPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => LeaderboardPageState();
}

class LeaderboardPageState extends State<LeaderboardPage>
{
  CommunityListElement com;

  LeaderboardPageState(this.com);


  @override
  Widget build(BuildContext context) {
    Leaderboard leaderboard=service.getLeaderboard(com.id);
    return Scaffold(
      appBar: buildSingleCommunityBar(com),
      body: ,
    )


  }
}