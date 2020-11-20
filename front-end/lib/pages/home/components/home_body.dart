import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            height: screenSize.height * 0.3,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              value: 50,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              semanticsLabel: "Challenge progress",
              semanticsValue: "Semantics Value",
            ))
      ],
    );
  }
}
