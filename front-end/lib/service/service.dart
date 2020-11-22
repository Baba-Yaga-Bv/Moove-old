import 'dart:convert';
import 'dart:core' as core;
import 'dart:io';

import 'package:moove/domain/access_token.dart';
import 'package:moove/domain/entities/challenges/challenge.dart';
import 'package:moove/domain/entities/user.dart';
import 'package:moove/domain/id.dart';
import 'package:http/http.dart' as http;

class Service {
  core.String url;
  HttpClient client;
  AccessToken token;

  Service() {
    url = "https://mooveapi.switzerlandnorth.cloudapp.azure.com:8000";
    token = AccessToken("");
    client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, core.String host, core.int port) => true);
  }

  core.Future<AccessToken> registerUser(
      email, firstName, lastName, password) async {
    core.Map data = {
      "email": email.toString(),
      "first_name": firstName.toString(),
      "last_name": lastName.toString(),
      "password": password.toString()
    };

    HttpClientRequest request =
        await client.postUrl(core.Uri.parse(url + "/users/register"));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(data)));

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      response.transform(utf8.decoder).listen((event) {
        core.print(event);
        core.Map<core.String, core.dynamic> json = jsonDecode(event);
        token.set(json['access_token'].toString());
      });
      core.print(token.get());
      return token;
    } else {
      throw core.Exception("Failed to register user");
    }
  }

  core.Future<AccessToken> loginUser(email, password) async {
    core.Map data = {
      "email": email.toString(),
      "password": password.toString()
    };

    HttpClientRequest request =
        await client.postUrl(core.Uri.parse(url + "/users/login"));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(data)));

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      response.transform(utf8.decoder).listen((event) {
        core.print(event);
        core.Map<core.String, core.dynamic> json = jsonDecode(event);
        token.set(json['access_token'].toString());
      });
      core.print(token.get());
      return token;
    } else {
      throw core.Exception("Failed to login user");
    }
  }

  core.Future<AccessToken> autoLoginUser() async {
    throw core.Exception("Failed to auto login");
  }

  core.Future<core.List<User>> getLeaderboard(Id id) async {}

  void startChallenge(Id id) async {}

  core.Future<core.List<Challenge>> getChallenges() {}
}
