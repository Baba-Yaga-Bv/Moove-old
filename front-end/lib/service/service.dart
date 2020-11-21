import 'dart:convert';
import 'dart:core' as core;

import 'package:moove/domain/access_token.dart';
import 'package:moove/domain/entities/challenges/challenge.dart';
import 'package:moove/domain/entities/community.dart';
import 'package:moove/domain/entities/user.dart';
import 'package:moove/service/repos/repo.dart';
import 'package:http/http.dart' as http;

class Service {
  core.String url = "http://10.0.2.2:8000";
  AccessToken token = AccessToken("");

  core.Future<AccessToken> registerUser(email, firstName, lastName, password) async {
    final http.Response response = await http.post(
      url + "/users/register",
      headers: <core.String, core.String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<core.String, core.String>{
        "email": email.toString(),
        "first_name": firstName.toString(),
        "last_name": lastName.toString(),
        "password": password.toString()
      }),
    );

    if (response.statusCode == 200) {
      core.Map<core.String, core.dynamic> json = jsonDecode(response.body);
      token.set(json['access_token'].toString());
      return token;
    } else {
      throw core.Exception("Failed to register user");
    }
  }

  core.Future<AccessToken> loginUser(email, password) async {
    final http.Response response = await http.post(
      url + "/users/login",
      headers: <core.String, core.String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<core.String, core.String>{
        "email": email.toString(),
        "password": password.toString()
      }),
    );

    if (response.statusCode == 200) {
      core.Map<core.String, core.dynamic> json = jsonDecode(response.body);
      token.set(json['access_token'].toString());
      return token;
    } else {
      throw core.Exception("Failed to login user");
    }
  }

  core.Future<AccessToken> autoLoginUser() async {
    throw core.Exception("Failed to auto login");
  }
}
