import 'package:moove/domain/period.dart';

import 'challenge.dart';

class StepsChallenge extends Challenge {
  int _currentStepsCount;
  final int _goalStepsCount;

  StepsChallenge(name, reward, period, this._goalStepsCount)
      : super(name, reward, period);

  set currentStepsCount(int value) {
    _currentStepsCount = value;
  }

  int get currentStepsCount => _currentStepsCount;
  int get goalStepsCount => _goalStepsCount;
}
