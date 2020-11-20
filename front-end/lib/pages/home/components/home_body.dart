import 'package:flutter/material.dart';
import 'package:moove/config.dart';

class HomeBody extends StatelessWidget {
  String get__main_stats_text() {
    int current_progress = 15;
    int total_progress = 30;

    return current_progress.toString() + "/" + total_progress.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [

        //Top containter
        Container(

          height: screenSize.height * 0.3,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,
                                    blurRadius: 30)],
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 48,
                        ),
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
                      get__main_stats_text(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 56,
                      ),
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
