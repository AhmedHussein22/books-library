abstract class SecureEnvKeysManger {
  // String get sentryDNS;

  String get baseUrl;
}

// DevSecureKeys class is used to store the keys for the development environment.
class DevSecureKeys implements SecureEnvKeysManger {
  // @override
  // String get sentryDNS => const String.fromEnvironment('sentryDNSDev');

  @override
  String get baseUrl => "https://gutendex.com";
}

// ProdSecureKeys class is used to store the keys for the production environment.
class ProdSecureKeys implements SecureEnvKeysManger {
  // @override
  // String get sentryDNS => const String.fromEnvironment('sentryDNSProd');

  @override
  String get baseUrl => "https://gutendex.com";
}
