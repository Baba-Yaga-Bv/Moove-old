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
        // Top blank space
        Container(
          height: 50,
        ),
        // Top row
        Row(
          children: [
            Spacer(),
            // Back to home button
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 40,
            )
          ],
        )
      ],
    );
  }
}