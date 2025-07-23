// ignore: constant_identifier_names
enum Currency { USD, EUR }

class Settings {
  //Singleton

  static final Settings _instance = Settings._internal();

  Settings._internal();

  factory Settings() {
    return _instance;
  }

  //Logic

  String _currentCurrency = 'USD';

  get currentCurrency => _currentCurrency;

  void changeCurrency({required String? value}) {
    _currentCurrency = value ?? 'USD';
  }
}
