import 'package:flutter/material.dart';
import 'CommunityListElement.dart';
import '../../../config.dart';

class CommunitiesBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommunitiesBodyState();
}



class ComunityInviteElement extends CommunityListElement {
  ComunityInviteElement(String name, AssetImage image) : super(name, image);
}

class CommunitiesBodyState extends State<CommunitiesBody> {
  List<CommunityListElement> myCommunities = [];

  List myInvites = [];
  getMyCommunities() {
    for (int i = 0; i < 10; i++)
      myCommunities.add(new CommunityListElement(
          "Supper Runners", AssetImage("assets/pictures/placeholder.jpg")));

    //TO DO
  }

  @override
  Widget build(BuildContext context) {
    getMyCommunities();
    return Column(children: [
      // Top container
      Expanded(
          child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: defaultBlurRadius)
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: defaultRoundedCorner,
                bottomRight: defaultRoundedCorner)),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return

            //Parrent list element

            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
              child: Container(


                //The row in which the image and name resign
                child:Row(
                  children: [
                    //Image Container
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: myCommunities[index].image
                        ),
                      ),
                    ),

                    //Community name

                    Padding(
                        padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                        child: Text(
                            '${myCommunities[index].name}',
                            style: mediumTextStyle
                        )
                    )



                  ],

                ) ,
              ),
            );


          },

          itemCount: myCommunities.length,
        ),
      ))
    ]);
  }
}
