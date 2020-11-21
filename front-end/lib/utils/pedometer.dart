import 'package:pedometer/pedometer.dart';
import 'dart:async';

class MoovePedometer {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;

  void onStepCount(StepCount event) {
    // Handle step count changed
    int steps = event.steps;
    DateTime timeStamp = event.timeStamp;
    print(steps.toString() + " | " + timeStamp.toString());
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    // Handle status changed
    String status = event.status;
    DateTime timeStamp = event.timeStamp;
    print(status.toString() + " | " + timeStamp.toString());
  }

  void onPedestrianStatusError(error) {
    // Handle the error
    print(error.toString());
  }

  void onStepCountError(error) {
    // Handle the error
    print(error.toString());
  }

  Future<void> initPlatformState() async {
    // Init streams
    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;

    // Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }
}
