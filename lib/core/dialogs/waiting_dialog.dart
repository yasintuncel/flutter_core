import 'package:flutter/material.dart';

import '../widgets/default_spaces.dart';
import 'style.dart';

Future<void> showWaitingDialog(
  context, {
  String message = '',
}) async {
  AlertDialog alert = AlertDialog(
    content: message.isEmpty
        ? Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          )
        : Column(
            children: [
              const CircularProgressIndicator(),
              getSpaceVertical(multiplierValue: 1),
              Text(
                message,
                textAlign: TextAlign.center,
              )
            ],
          ),
    shape: dialogRadius,
    actionsAlignment: MainAxisAlignment.spaceEvenly,
  );
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: const Color.fromARGB(127, 0, 0, 0),
    builder: (BuildContext context) {
      return alert;
    },
  );
}
