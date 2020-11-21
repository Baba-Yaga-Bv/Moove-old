import 'package:flutter/material.dart';
import 'package:moove/domain/access_token.dart';
import 'package:moove/domain/entities/user.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/home/home_page.dart';
import 'package:moove/main.dart';

import '../user_auth_page_login.dart';

class UserAuthSignUpBody extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: screenSize.height,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: [
                  //Email
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Enter your email",
                          labelText: "Email *"),
                    ),
                  ),
                  //First name
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: TextFormField(
                      controller: _firstName,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_box),
                          hintText: "Forename",
                          labelText: "First name *"),
                    ),
                  ),
                  //Last name
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: TextFormField(
                      controller: _lastName,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_box),
                          hintText: "Family name",
                          labelText: "Last name *"),
                    ),
                  ),
                  //Password
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          hintText: "Enter your password",
                          labelText: "Password *"),
                    ),
                  ),
                  //Sign in button
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: TextButton(
                        child: Text("Sign up", style: mediumTextStyle),
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        onPressed: () {
                          try {
                            service.registerUser(_email.text.toString(), _firstName.text.toString(), _lastName.text.toString(), _password.text.toString()).then(
                              (AccessToken token) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage()
                                  )
                                );
                              }
                            );
                          } catch (exception) {
                            print("Error: " + exception.toString());
                          }
                        }),
                  ),
                  //Not this page
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
                      child: Text(
                        "Already have an account?",
                        style: smallTextStyle,
                      )),
                  //Login
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextButton(
                        child: Text("Login", style: mediumTextStyle),
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserAuthLogin()));
                        }),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
