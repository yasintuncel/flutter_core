import 'package:flutter/material.dart';

import 'common/views/splash/view.dart';
import 'core/features/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App',
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: const SplashView(),
    );
  }
}
