import 'package:flutter/material.dart';
import '../constants/values.dart';

Widget getSpaceVertical({multiplierValue = 0.5}) {
  return SizedBox(height: defaultPaddingValue * multiplierValue);
}

Widget getSpaceHorizontal({multiplierValue = 0.5}) {
  return SizedBox(width: defaultPaddingValue * multiplierValue);
}
