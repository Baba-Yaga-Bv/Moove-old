import 'package:flutter/material.dart';
import 'package:moove/domain/entities/community.dart';
import 'package:moove/main.dart';
import '../single_community_page.dart';
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
  List<Community> communities;

  CommunitiesBodyState() {
    service.getCommunities().then((value) {
      communities = value;
      for (int i = 0; i < communities.length; i++) {
        myCommunities.add(new CommunityListElement(communities[i].name,
            AssetImage("assets/pictures/placeholder.jpg")));
      }
      setState(() {});
    });
  }

  List myInvites = [];

  @override
  Widget build(BuildContext context) {
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
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleCommunityPage(myCommunities[index])));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
                      child: Container(
                        //The row in which the image and name resign
                        child: Row(
                          children: [
                            //Image Container
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: myCommunities[index].image),
                              ),
                            ),

                            //Community name

                            Padding(
                                padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                                child: Text('${myCommunities[index].name}',
                                    style: mediumTextStyle))
                          ],
                        ),
                      ),
                    ));
          },
          itemCount: myCommunities.length,
        ),
      ))
    ]);
  }
}
