import 'package:flutter/material.dart';
import 'package:moove/domain/entities/challenges/challenge.dart';
import 'package:moove/domain/entities/challenges/steps_challenge.dart';
import 'package:moove/main.dart';
import 'CommunityListElement.dart';
import '../../../config.dart';
import 'communities_body.dart';


class SingleCommunityBody extends StatefulWidget{

  CommunityListElement com;


  SingleCommunityBody(this.com);

  @override
  State<StatefulWidget> createState() => SingleCommunityBodyState();
}

class SingleCommunityBodyState extends State<SingleCommunityBody>{

  SingleCommunityBodyState(this.com);

  CommunityListElement com;
  Challenge challenge;
  List<Challenge> challenges=service.getChallenges();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return

          Container(

            height: screenSize.height,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,),
            child: Column(
              children: [

                //Main challenge of the community
                Container(
                  height: screenSize.height*0.3,
                  decoration: BoxDecoration(
                    border:Border.all(color: Theme.of(context).accentColor,width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(35))

                  ),
                  child: Row(
                    children: [
                      Text(challenges[0].name,
                      style: mediumTextStyle,),
                      ElevatedButton(onPressed: service.startChallenge(challenges[0].id), child: null)
                    ],

                  ),

          )
            ,
             //Leaderboard
             Padding(
               padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>LeaderBoardPage(com.id)
                  ));
                },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                    ),
                    child:Text(
                      "Leaderboard",
                      style: mediumTextStyle,
                    ),

                ),
             ),

                Text("Old challenges",style: mediumTextStyle)
                ,
                //Old Challenges List
                ListView.builder(itemBuilder: (BuildContext context ,int index)
                {
                return Container(
                  decoration: BoxDecoration(
                      border:Border.all(color: Theme.of(context).accentColor,width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  child:Text(
                      '${challenges[index].name}',
                      style: mediumTextStyle,
                    ),
                );
                })
              ],
          )
          );
  }


}