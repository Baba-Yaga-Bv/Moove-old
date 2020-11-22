import 'db_entity.dart';

class Community extends DbEntity {
  String _name;
  bool _isJoined;

  Community(this._name, this._isJoined);

  String get name => _name;
  bool get isJoined => _isJoined;
}
