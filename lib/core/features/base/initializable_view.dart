import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/values.dart';

mixin InitializableView {
  bool isInitialized = false;

  handle();

  initialize(setState, {int duration = 150}) async {
    isInitialized = false;
    setState();
    await handle();
    await Future.delayed(Duration(milliseconds: duration));
    isInitialized = true;
    setState();
  }

  Widget getBody();

  double waitingSize = 75;
  Widget getInitializeWidget({String message = 'Loading...'}) {
    return Center(
      child: SizedBox(
        height: 1.75 * waitingSize,
        width: 1.75 * waitingSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: defaultRadius * 50,
              child: SizedBox(
                height: waitingSize * .9,
                child: Image.asset(
                  'assets/waiting.gif',
                ),
              ),
            ),
            SizedBox(
              height: waitingSize,
              width: waitingSize,
              child: const CircularProgressIndicator(
                color: mainColor,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getNoRecordWidget({
    String message = 'No Record.',
    String image = 'assets/images/nocontent.png',
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 110,
          ),
          const SizedBox(height: 20),
          Text(
            message,
          ),
        ],
      ),
    );
  }
}
