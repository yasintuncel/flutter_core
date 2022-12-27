import 'package:flutter/material.dart';

import '../constants/values.dart';

Widget getButton(
  BuildContext context,
  String title,
  onPressed, {
  fontSize = 18.0,
  color = null,
  borderRadius = 1.0,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(defaultRadiusValue * borderRadius),
    child: ElevatedButton(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50), // NEW
        backgroundColor: color,
      ),
      onPressed: onPressed,
    ),
  );
}

Widget getTextButton(BuildContext context, String title, onPressed, {fontSize: 18.0, color = null, textColor = null}) {
  return TextButton(
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fontSize, color: textColor),
    ),
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50), // NEW
      backgroundColor: color,
    ),
    onPressed: onPressed,
  );
}
