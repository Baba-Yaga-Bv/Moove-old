import 'package:moove/domain/period.dart';

import '../../user_points.dart';
import '../db_entity.dart';

abstract class Challenge extends DbEntity {
  String _name;
  UserPoints _reward;
  Period _period;

  Challenge(this._name, this._reward, this._period);

  String get name => _name;
  UserPoints get reward => _reward;

  Period get period => _period;

  set period(Period value) {
    _period = value;
  }
}
