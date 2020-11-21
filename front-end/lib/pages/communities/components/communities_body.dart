import 'package:flutter/material.dart';

import '../../../config.dart';

class CommunitiesBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommunitiesBodyState();
}

class CommunitiesBodyState extends State<CommunitiesBody> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        // Top container
        Container(
          height: screenSize.height * 0.05,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, blurRadius: defaultBlurRadius)],
            borderRadius: BorderRadius.only(
              bottomLeft: defaultRoundedCorner,
              bottomRight: defaultRoundedCorner
            )
          )
        )
      ]
    );
  }
}