import 'package:flutter/material.dart';

import '../../constants/colors.dart';

ThemeData getThemeData() {
  return ThemeData.light().copyWith(
    primaryColor: mainColor,
    indicatorColor: mainColor,
    splashColor: mainColor,
    primaryColorDark: mainColorDark,
    highlightColor: mainColor,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(mainColor),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      secondary: mainColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: mainColor,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(mainColor),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: fumeColor,
      splashColor: mainColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: mainColor),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(mainColor),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) return mainColor.withOpacity(0.04);
            if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) return mainColor.withOpacity(0.12);
            return null; // Defer to the widget's default.
          },
        ),
      ),
    ),
  );
}
