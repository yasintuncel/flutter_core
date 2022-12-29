import 'package:flutter/material.dart';

import 'theme_types.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'themes/main_theme.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier();

  Map<ThemeTypes, ThemeData> themes = {
    ThemeTypes.dark: darkTheme,
    ThemeTypes.light: lightTheme,
    ThemeTypes.main: mainTheme,
  };

  ThemeTypes themeType = ThemeTypes.main;
  ThemeData get currentTheme => themes[themeType]!;

  switchTheme(ThemeTypes type) async {
    themeType = type;
    notifyListeners();
  }
}
