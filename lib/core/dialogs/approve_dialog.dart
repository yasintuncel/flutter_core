import 'package:flutter/material.dart';

import 'style.dart';

showApproveDialog(
  BuildContext context, {
  required String message,
  String title = 'Mesaj',
  String cancelButtonText = 'Geri',
  String approveButtonText = 'Tamam',
}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(cancelButtonText, style: cancelButtonTextStyle),
    onPressed: () {
      Navigator.pop<bool>(context, false);
    },
  );
  Widget continueButton = TextButton(
    onPressed: () async {
      Navigator.pop<bool>(context, true);
    },
    style: approveButtonStyle,
    child: Text(
      approveButtonText,
      style: approveButtonTextStyle,
    ),
  );
  Widget contentMessage = Text(
    message,
    textAlign: TextAlign.center,
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title, textAlign: TextAlign.center),
    actionsAlignment: MainAxisAlignment.spaceEvenly,
    content: contentMessage,
    shape: dialogRadius,
    actions: [
      Column(
        children: [
          horizontalSeparator,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              cancelButton,
              continueButton,
            ],
          ),
        ],
      ),
    ],
  );

  return showDialog<bool>(
    context: context,
    barrierColor: Colors.black54,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
