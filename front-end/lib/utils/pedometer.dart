import 'package:pedometer/pedometer.dart';
import 'dart:async';

class MoovePedometer {
  int _stepCountValue = -1;
  StreamSubscription<StepCount> _subscription;

  MoovePedometer() {
    print("Starting pedometer...");
    setUpPedometer();
  }

  void setUpPedometer() {
    _subscription = Pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void _onData(StepCount stepCountValue) async {
    print(stepCountValue);
    _stepCountValue = stepCountValue.steps;
  }

    void _onError(error) {
      print("Pedometer error: $error");
    }

    void _onDone() {}
}
