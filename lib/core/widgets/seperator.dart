import 'package:flutter/material.dart';

Widget getSeparator({
  EdgeInsetsGeometry padding = const EdgeInsets.all(0.0),
  height = 1.0,
}) {
  return Container(
    margin: padding,
    height: height,
    color: Colors.black26,
  );
}
