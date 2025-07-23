import 'package:flutter/material.dart';

enum ThemeNames { yellow, green }

class Themes with ChangeNotifier {
  ThemeData getCurrentTheme() {
    return _currentTheme;
  }

  void switchThemeTo({required var name}) {
    switch (name) {
      case ThemeNames.yellow:
        _currentTheme = yellowTheme;
      case ThemeNames.green:
        _currentTheme = greenTheme;
      default:
        _currentTheme = yellowTheme;
    }
    notifyListeners();
  }

  late ThemeData _currentTheme = yellowTheme;

  final ThemeData yellowTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorSchemeSeed: Colors.yellow,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber[300],
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 18,
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );

  final ThemeData greenTheme = ThemeData(
    colorSchemeSeed: Colors.green[300],
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
  );
}
