import 'package:flutter/cupertino.dart';

import '../services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _dartTheme = false;
  bool get getDarkTheme => _dartTheme;

  set setDarkTheme(bool value) {
    _dartTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
