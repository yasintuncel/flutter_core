import 'package:flutter/material.dart';

import '../constants/values.dart';

Widget getButton(
  BuildContext context,
  String title,
  onPressed, {
  fontSize = 18.0,
  color,
  borderRadius = 1.0,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(defaultRadiusValue * borderRadius),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50), // NEW
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize),
      ),
    ),
  );
}

Widget getTextButton(BuildContext context, String title, onPressed, {fontSize = 18.0, color, textColor}) {
  return TextButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50), // NEW
      backgroundColor: color,
    ),
    onPressed: onPressed,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fontSize, color: textColor),
    ),
  );
}
