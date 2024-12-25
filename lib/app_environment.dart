import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, staging, prod }

abstract class AppEnvironment {
  static String name = dotenv.env["FLAVOR"] ?? "NA";
  static String apiUrl = dotenv.env["API_URL"] ?? "";
  static Environment _environment = Environment.dev;

  static Environment get environment => _environment;

  static Future<void> setupEnv(Environment env) async {
    _environment = env;

    // Load the appropriate .env file
    switch (env) {
      case Environment.dev:
        await dotenv.load(fileName: ".env.dev");
        break;
      case Environment.staging:
        await dotenv.load(fileName: ".env.staging");
        break;
      case Environment.prod:
        await dotenv.load(fileName: ".env.prod");
        break;
    }

    // Update the name and apiUrl dynamically
    apiUrl = dotenv.env["API_URL"] ?? "";
    name = dotenv.env["FLAVOR"] ?? "NA";
  }
}
