class FlavorConfig {
  final String name;
  final String apiUrl;

  static FlavorConfig? _instance;

  FlavorConfig._internal({required this.name, required this.apiUrl});

  static void initialize({required String name, required String apiUrl}) {
    _instance = FlavorConfig._internal(name: name, apiUrl: apiUrl);
  }

  static FlavorConfig get instance => _instance!;
}
