import 'package:flutter/material.dart';

class CommunitiesBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommunitiesBodyState();
}

class CommunitiesBodyState extends State<CommunitiesBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
        ),
        Row(
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 40,
            )
          ],
        ),
        Column(

        )
      ],
    );
  }
}