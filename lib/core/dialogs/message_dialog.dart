import 'package:flutter/material.dart';
import 'style.dart';

Future<void> showMessageDialog(
  context, {
  required String message,
  String title = 'Mesaj',
}) async {
  Widget contentMessage = Text(
    message,
    textAlign: TextAlign.center,
  );

  Widget cancelButton = TextButton(
    child: Text('Kapat', style: closeButtonTextStyle),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title, textAlign: TextAlign.center),
    content: contentMessage,
    shape: dialogRadius,
    actionsAlignment: MainAxisAlignment.spaceEvenly,
    actions: [
      Column(
        children: [
          horizontalSeparator,
          cancelButton,
        ],
      ),
    ],
  );
  return showDialog(
    context: context,
    barrierColor: Colors.black54,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
