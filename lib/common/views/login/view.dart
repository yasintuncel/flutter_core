import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: gradiant,
          child: const Center(
            child: Text(
              'Login',
            ),
          ),
        ),
      ),
    );
  }
}
