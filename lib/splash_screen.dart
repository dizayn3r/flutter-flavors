import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app_environment.dart';
import 'package:flutter_flavors/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Image setImage(Environment env) {
      switch (env) {
        case Environment.dev:
          return Image.asset("assets/icons/dev_icon.png");
        case Environment.staging:
          return Image.asset(
            "assets/icons/staging_icon.png",
            color: Colors.greenAccent,
            colorBlendMode: BlendMode.hue,
          );
        case Environment.prod:
          return Image.asset("assets/icons/prod_icon.png");
      }
    }

    Color setColor(Environment env) {
      switch (env) {
        case Environment.dev:
          return Colors.blueAccent;
        case Environment.staging:
          return Colors.greenAccent;
        case Environment.prod:
          return Colors.redAccent;
      }
    }

    return AnimatedSplashScreen(
      splashIconSize: 200,
      backgroundColor: setColor(AppEnvironment.environment),
      splash: Center(
        child: setImage(AppEnvironment.environment),
      ),
      nextScreen: MyHomePage(title: AppEnvironment.name),
    );
  }
}
