import 'package:flutter/material.dart';
import 'package:moove/config.dart';

class HomeBody extends StatelessWidget {
  String getMainStatsText() {
    int currentProgress = 15;
    int totalProgress = 30;
    return currentProgress.toString() + "/" + totalProgress.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        // Top container
        Container(
          height: screenSize.height * 0.3,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, blurRadius: defaultBlurRadius)],
            borderRadius: BorderRadius.only(
              bottomLeft: defaultRoundedCorner,
              bottomRight: defaultRoundedCorner
            )
          ),
          // Progress metric
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Progress text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Challenge name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                ]
              ),
              // Progress circle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation(Colors.red),
                      value: 0.5
                    ),
                  )
                ]),
              // Progress stats text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    getMainStatsText(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 56,
                    ),
                  ),
                ],
              )
            ],
          )
        )
      ],
    );
  }
}
