import 'package:flutter/material.dart';

import '../../../config.dart';

class ProfileBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileBodyState();
}

class ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        // Top container
        Container(
          height: screenSize.height * 0.4,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, blurRadius: defaultBlurRadius)],
            borderRadius: BorderRadius.only(
              bottomLeft: defaultRoundedCorner,
              bottomRight: defaultRoundedCorner
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile pic
              Center(
                child:
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/pictures/placeholder.jpg")
                      ),
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, mediumPadding, 0, 0),
              ),
              // Name
              Center(
                child:
                  Text(
                    "Linux Fox",
                    style: mediumTextStyle
                  )
              )
            ],
          ),
        )
      ],
    );
  }

}