import 'community.dart';
import 'db_entity.dart';

class User extends DbEntity {
  String _firstName;
  String _lastName;
  String _email;
  List<Community> _communities;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  List<Community> get communities => _communities;
}