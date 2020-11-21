import 'package:moove/domain/entities/challenges/challenge.dart';
import 'package:moove/domain/entities/community.dart';
import 'package:moove/domain/entities/user.dart';

abstract class Repo<Entity> {
  void add(Entity entity) {

  }

}

class UserRepo extends Repo<User> {

}

class ChallengeRepo extends Repo<Challenge> {

}

class CommunityRepo extends Repo<Community> {

}
