class Period {
  DateTime _startMoment;
  DateTime _endMoment;

  Period(start, end) {
    _startMoment = DateTime.parse(start);
    _endMoment = DateTime.parse(end);
  }

  DateTime get startMoment => _startMoment;
  DateTime get endMoment => _endMoment;
}
