import 'package:flutter/material.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/home/home_page.dart';

class UserAuthSignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: screenSize.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Enter your email",
                            labelText: "Email *"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_box),
                            hintText: "Forename",
                            labelText: "First name *"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_box),
                            hintText: "Family name",
                            labelText: "Last name *"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            hintText: "Enter your password",
                            labelText: "Password *"),
                      ),
                    ),

                    Padding(
                      padding:EdgeInsets.fromLTRB(30, 50, 30, 0),
                      child: TextButton(
                          child: Text("Sign up", style: mediumTextStyle),
                          style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()));
                          }) ,),

                    Padding(
                        padding:EdgeInsets.fromLTRB(30, 100, 30, 0),
                        child: Text(
                          "Already have an account?",
                          style: smallTextStyle,
                        )
                    ),

                    Padding(
                      padding:EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: TextButton(
                          child: Text("Login", style: mediumTextStyle),
                          style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()));
                          }) ,)

                  ],
                )),
          ],
        ),
      );



  }
}
