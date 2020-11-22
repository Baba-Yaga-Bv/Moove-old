import 'package:moove/domain/id.dart';

class DbEntity {
  Id _id;

  Id get id => _id;

  set id(Id value) {
    _id = value;
  }
}
