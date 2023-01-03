import 'package:flutter/material.dart';

import '../extensions/color.dart';

// main color // 0xffd00000
const Color mainColor = Color.fromARGB(255, 10, 178, 255);

const Color mainColorDark = Color(0xff9d0208);

const Color borderColor = Color(0xff444444);

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
