import 'challenges/challenge.dart';
import 'db_entity.dart';

class Community extends DbEntity{
  String _name;
  Challenge _currentChallenge;

  String get name => _name;
  Challenge get currentChallenge => _currentChallenge;
}
