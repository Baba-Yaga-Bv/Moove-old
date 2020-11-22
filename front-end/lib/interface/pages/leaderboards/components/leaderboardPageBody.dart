import 'package:flutter/cupertino.dart';
import 'package:moove/interface/pages/communities/components/CommunityListElement.dart';
import 'package:moove/main.dart';

import '../../../config.dart';

class leaderboardBody extends StatefulWidget{
  CommunityListElement com;

  leaderboardBody(this.com);

  @override
  State<StatefulWidget> createState() =>leaderboardBodyState(com)
}

class leaderboardBodyState extends State<leaderboardBody>{

  CommunityListElement com;
  Leaderboard leaderboard=service.getLeaderboard(com.id);
  leaderboardBodyState(this.com);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index)
        {
          return Row(
            children: [
              Text(
                '${index}',
                style: superSmallTextStyle,
              ),
              Text(
                '${leaderboard[index].name}',
                style: superSmallTextStyle,
              ),
              Text(
                  '${leaderboard[index].score}'
              )
            ],
          );
        },

        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: null);
  }
}