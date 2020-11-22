import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/communities/components/CommunityListElement.dart';
import 'package:moove/service/service.dart';

<<<<<<< Updated upstream

class LeaderboardPage extends StatefulWidget{

=======
class LeaderboardPage extends StatefulWidget {
  CommunityListElement com;
  LeaderboardPage(this.com);
>>>>>>> Stashed changes
  @override
  State<StatefulWidget> createState() => LeaderboardPageState(com);
}

class LeaderboardPageState extends State<LeaderboardPage>
{
  CommunityListElement com;
  LeaderboardPageState(this.com);


  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    Leaderboard leaderboard=service.getLeaderboard(com.id);
=======
    List<User> leaderboard = List<User>();
    service.getLeaderboard(com.id).then((List<User> value) {
      leaderboard = value;
      setState(() {});
    });
>>>>>>> Stashed changes
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