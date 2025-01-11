enum Environment { dev, staging, prod }

abstract class AppEnvironment {
  static String name = "Development";
  static String apiUrl = "https://dev-api.example.com";
  static Environment _environment = Environment.dev;

  static Environment get environment => _environment;

  static Future<void> setupEnv(Environment env) async {
    _environment = env;

    // Load the appropriate .env file
    switch (env) {
      case Environment.dev:
        name = "Development";
        apiUrl = "https://dev-api.example.com";
        break;
      case Environment.staging:
        name = "Staging";
        apiUrl = "https://staging-api.example.com";
        break;
      case Environment.prod:
        name = "Production";
        apiUrl = "https://api.example.com";
        break;
    }

    // Update the name and apiUrl dynamically
    apiUrl = "https://dev-api.example.com";
    name = "Development";
  }
}
