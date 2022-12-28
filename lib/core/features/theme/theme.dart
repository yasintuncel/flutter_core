import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../extensions/color.dart';

// 0xffd00000
MaterialColor mainMaterialColor = MaterialColor(
  mainColor.toHex(),
  <int, Color>{
    50: mainColor.withOpacity(.1),
    100: mainColor.withOpacity(.2),
    200: mainColor.withOpacity(.3),
    300: mainColor.withOpacity(.4),
    400: mainColor.withOpacity(.5),
    500: mainColor.withOpacity(.6),
    600: mainColor.withOpacity(.7),
    700: mainColor.withOpacity(.8),
    800: mainColor.withOpacity(.9),
    900: mainColor.withOpacity(1),
  },
);

ThemeData mainTheme = ThemeData(
  primarySwatch: mainMaterialColor,
);
