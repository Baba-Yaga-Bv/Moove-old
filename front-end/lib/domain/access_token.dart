class AccessToken {
  String _value;

  String get value => _value;
  set value(String value) {
    _value = value;
  }

  AccessToken(this._value);

  String get() => value;

  void set(String value) {
    this.value = value;
  }
}