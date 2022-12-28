import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

BoxDecoration gradiant = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      mainColor,
      mainColor.withOpacity(.2),
    ],
  ),
);
