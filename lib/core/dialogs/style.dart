import 'package:flutter/material.dart';

import '../constants/values.dart';

RoundedRectangleBorder dialogRadius = RoundedRectangleBorder(borderRadius: defaultRadius * 2);

Widget horizontalSeparator = Container(height: 0.5, color: const Color.fromARGB(255, 97, 97, 97));
TextStyle closeButtonTextStyle = const TextStyle(fontSize: 16, color: Colors.blue);
TextStyle cancelButtonTextStyle = const TextStyle(fontSize: 16, color: Colors.black);
TextStyle approveButtonTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

ButtonStyle approveButtonStyle = TextButton.styleFrom(foregroundColor: Colors.blue);
