import 'package:flutter/material.dart';

Widget getCircularContainer(child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(150),
    child: child,
  );
}
