import 'package:flutter/material.dart';
import 'package:flutter_flavors/app_environment.dart';

import 'splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color setSeedColor(Environment env) {
      switch (env) {
        case Environment.dev:
          return Colors.blue;
        case Environment.staging:
          return Colors.green;
        case Environment.prod:
          return Colors.red;
      }
    }

    return MaterialApp(
      title: AppEnvironment.name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: setSeedColor(AppEnvironment.environment),
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
