import 'package:flutter/material.dart';
import 'package:moove/config.dart';

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
              bottomLeft: defaultRoundedCorner,
              bottomRight: defaultRoundedCorner
            )
          ),
        ),
        Container(
          height: 40
        ),
        Container(
          height: screenSize.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(defaultRoundedCorner)
          ),
        )
      ],
    );
  }

}