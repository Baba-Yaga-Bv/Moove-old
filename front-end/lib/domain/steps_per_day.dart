class StepsPerDay {
  DateTime _date;
  int _currentSteps;

  DateTime get date => _date;
  int get currentSteps => _currentSteps;

  StepsPerDay(this._date, this._currentSteps);

  void addSteps(int value) {
    this._currentSteps += value;
  }

  String dateString() {
    switch (_date.weekday) {
      case 1: return "mon";
      case 2: return "tue";
      case 3: return "wed";
      case 4: return "thu";
      case 5: return "fri";
      case 6: return "sat";
      case 7: return "sun";
      default: return null;
    }
  }
}