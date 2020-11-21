import 'package:flutter/material.dart';
import 'package:moove/domain/access_token.dart';
import 'package:moove/interface/config.dart';
import 'package:moove/interface/pages/home/home_page.dart';
import 'package:moove/main.dart';

import '../user_auth_page_sign_in.dart';

class UserAuthLoginBody extends StatelessWidget {
  TextEditingController _email = TextEditingController();
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          hintText: "Enter your password",
                          labelText: "Password *"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                    child: TextButton(
                        child: Text("Login", style: mediumTextStyle),
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 130, 30, 0),
                      child: Text(
                        "Don't have an account?",
                        style: smallTextStyle,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextButton(
                      child: Text("Sign up", style: mediumTextStyle),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {
                        try {
                          service.loginUser(_email.text.toString(), _password.text.toString()).then(
                            (AccessToken token) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserAuthSignIn()
                                )
                              );
                            }
                          );
                        } catch (exception) {
                          print("Error: " + exception.toString());
                        }
                      }),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
