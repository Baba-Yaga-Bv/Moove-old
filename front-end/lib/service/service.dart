import 'dart:convert';
import 'dart:core' as core;

import 'package:moove/domain/entities/challenges/challenge.dart';
import 'package:moove/domain/entities/community.dart';
import 'package:moove/domain/entities/user.dart';
import 'package:moove/service/repos/repo.dart';
import 'package:http/http.dart' as http;


class Service {
  Repo<User> userRepo = UserRepo();
  Repo<Challenge> challengeRepo = ChallengeRepo();
  Repo<Community> communityRepo = CommunityRepo();

  void registerUser(email, firstName, lastName, password) async {
    final http.Response response = await http.post(
      "https://localhost:8000/users/register",
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
      User user = User(firstName, lastName, email);
      user.id = json['user_profile']['id'].toString();

      userRepo.add(user);
    } else {
      throw core.Exception('Failed to load album');
    }
  }
}
