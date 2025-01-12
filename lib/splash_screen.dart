import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavors/app_environment.dart';
import 'package:flutter_flavors/home_page.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart'; // Import the Shorebird package

import 'update_screen.dart'; // Import your update screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isUpdateAvailable = false;
  bool _isLoading = true;
  UpdateStatus updateStatus = UpdateStatus.upToDate;
  final updater = ShorebirdUpdater();

  @override
  void initState() {
    super.initState();
    _checkForUpdates();
  }

  // Check for updates and set the state based on the result
  Future<void> _checkForUpdates() async {
    try {
      updateStatus = await updater.checkForUpdate();

      if (updateStatus == UpdateStatus.outdated) {
        setState(() {
          _isUpdateAvailable = true;
        });
      } else {
        setState(() {
          _isUpdateAvailable = false;
        });
      }
    } catch (e) {
      print("Error checking for updates: $e");
      setState(() {
        _isUpdateAvailable = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Define the image based on the environment
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

  // Define the color based on the environment
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

  @override
  Widget build(BuildContext context) {
    // Show loading while checking for updates
    if (_isLoading) {
      return AnimatedSplashScreen(
        splashIconSize: 200,
        backgroundColor: setColor(AppEnvironment.environment),
        splash: Center(
          child: setImage(AppEnvironment.environment),
        ),
        nextScreen: SizedBox(), // Placeholder while loading
      );
    }

    // If update is available, navigate to UpdateScreen
    if (_isUpdateAvailable) {
      return UpdateScreen(
          updater: updater); // Navigate to UpdateScreen if update is available
    }

    // Otherwise, navigate to the HomeScreen
    return AnimatedSplashScreen(
      splashIconSize: 200,
      backgroundColor: setColor(AppEnvironment.environment),
      splash: Center(
        child: setImage(AppEnvironment.environment),
      ),
      nextScreen:
          MyHomePage(title: AppEnvironment.name), // HomeScreen if no update
    );
  }
}
