import 'package:moove/domain/period.dart';

import 'challenge.dart';

class StepsChallenge extends Challenge {
  int _currentStepsCount;
  int _goalStepsCount;
  Period _period;
  int _point;

  StepsChallenge(
      this._currentStepsCount, this._goalStepsCount, this._period, this._point);

  int get point => _point;

  set point(int value) {
    _point = value;
  }

  set currentStepsCount(int value) {
    _currentStepsCount = value;
  }



  Period get period => _period;

  set period(Period value) {
    _period = value;
  }

  int get currentStepsCount => _currentStepsCount;
  int get goalStepsCount => _goalStepsCount;

  set goalStepsCount(int value) {
    _goalStepsCount = value;
  }
}
