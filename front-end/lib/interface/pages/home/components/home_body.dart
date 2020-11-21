import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';

class HomeBody extends StatelessWidget {
  String getMainStatsText() {
    int currentProgress = 15;
    int totalProgress = 30;


    return currentProgress.toString() + "/" + totalProgress.toString();
  }

  String getStepsToday() {
    int stepsToday = 1000;
    return "Steps today: " + stepsToday.toString();

  }

  @override
  Widget build(BuildContext context) {

    //The values in the list come from here
    List toDisplay = [
      getStepsToday(),
      "Hello there ",
      "Hello there ",
      "Hello there "
    ];
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [

        //Top containter
        Container(
            height: screenSize.height * 0.3,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor, blurRadius: 30)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),

            //Progress metric

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Progess text
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Challenge name",
                        style: mediumTextStyle,
                      ),
                    ]),

                //Progress circle
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation(Colors.red),
                            value: 0.5),
                      )
                    ]),

                //Progess text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      getMainStatsText(),
                      style: mediumTextStyle,
                    ),
                  ],
                )
              ],
            )),

        // The list bellow child
        Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                itemCount: toDisplay.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: screenSize.height*0.2,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(35))
                    ),
                    child: Center(
                        child: Text(
                      'Entry ${toDisplay[index]}',
                      style: mediumTextStyle,
                    )),
                  );
                },
              separatorBuilder: (BuildContext context, int index) => const Divider(),

                )


        ),

      ],
    );
  }
}
