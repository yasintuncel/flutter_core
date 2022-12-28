import 'package:flutter/material.dart';

import '../extensions/color.dart';

// main color // 0xffd00000
const Color mainColor = Color.fromARGB(255, 10, 178, 255);

const Color mainColorDark = Color(0xff9d0208);

// text colors
const Color mainTextColor = Color(0xffebebeb);

const Color mainTextColorLight = Color(0xffffdd00);
const Color mainTextColorDark = Color(0xffcccccc);

const Color mainWhiteColor = Colors.white;

const Color whiteLight = Color(0xfff4f4f4);
const Color fumeColor = Color(0xff444444);
const Color fumeColorLigth = Color(0xff777777);

const Color textLigth = Colors.green;

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
