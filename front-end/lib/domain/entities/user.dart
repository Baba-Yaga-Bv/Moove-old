import '../steps_per_day.dart';
import 'community.dart';
import 'db_entity.dart';

class User extends DbEntity {
  String _firstName;
  String _lastName;
  String _email;
  List<Community> _communities;
  StepsPerDay _stepsForToday;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  List<Community> get communities => _communities;
  int get stepsForToday => _stepsForToday.currentSteps;

  User(this._firstName, this._lastName, this._email);
}
