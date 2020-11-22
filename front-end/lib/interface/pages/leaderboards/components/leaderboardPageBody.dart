import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moove/domain/entities/user.dart';
import 'package:moove/interface/pages/communities/components/CommunityListElement.dart';
import 'package:moove/main.dart';

import '../../../config.dart';

class LeaderboardBody extends StatefulWidget {
  CommunityListElement com;

  LeaderboardBody(this.com);

  @override
  State<StatefulWidget> createState() => LeaderboardBodyState(com);
}

class LeaderboardBodyState extends State<LeaderboardBody> {
  CommunityListElement com;
  List<User> leaderboard;

  LeaderboardBodyState(this.com) {
    service.getLeaderboard(com.id).then((value) {
      leaderboard = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(
                '${index}',
                style: superSmallTextStyle,
              ),
              Text(
                '${leaderboard[index].firstName + " " + leaderboard[index].lastName}',
                style: superSmallTextStyle,
              ),
              Text('${leaderboard[index].points.value}')
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: null);
  }
}
