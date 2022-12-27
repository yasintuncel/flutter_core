import 'package:flutter/material.dart';

pushNextScreen(BuildContext context, Widget screen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
    // PageRouteBuilder(
    //     pageBuilder: (context, animation1, animation2) => Page1(),
    //     transitionDuration: Duration.zero,
    //     reverseTransitionDuration: Duration.zero,
    // ),
  );
}

replaceNextScreen(BuildContext context, Widget screen) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

popUntilNextScreen(BuildContext context, Widget screen) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => screen),
    (Route<dynamic> route) => false,
  );
}

popScreen(BuildContext context) {
  return Navigator.of(context).pop();
}
