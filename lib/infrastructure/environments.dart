abstract class Environments {
  static String? _baseUrl;
  static Flavor? _flavor;
  static const String _devUrl = apiUrl;
  static const String _qaUrl = apiUrl;
  static const String _prodUrl = apiUrl;

  static const String apiUrl = String.fromEnvironment(
    "APPENVURL",
    defaultValue: '',
  );

  static String get baseUrl => _baseUrl ?? apiUrl;
  static Flavor get flavor => _flavor ?? Flavor.dev;

  static void init(Flavor flavor) {
    _flavor = flavor;
    switch (flavor) {
      case Flavor.dev:
        _baseUrl = _devUrl;
        break;
      case Flavor.qa:
        _baseUrl = _qaUrl;
        break;
      case Flavor.prod:
        _baseUrl = _prodUrl;
        break;
      default:
        _baseUrl = _devUrl;
        break;
    }
  }
}

enum Flavor {
  dev,
  qa,
  prod,
}
