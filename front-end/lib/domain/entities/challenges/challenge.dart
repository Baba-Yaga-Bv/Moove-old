import '../../user_points.dart';
import '../db_entity.dart';

abstract class Challenge extends DbEntity {
  String _name;
  UserPoints _reward;

  String get name => _name;
  UserPoints get reward => _reward;
}
