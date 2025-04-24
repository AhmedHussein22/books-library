import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/resources/secure_env_keys_manger.dart';

class EnvironmentConfig {
  EnvironmentConfig({
    required this.title,
    required this.secureEnvKeysManger,
  });
  final String title;
  final SecureEnvKeysManger secureEnvKeysManger;
}

class F {
  static Flavor? appFlavor;

  // Singleton pattern to ensure one-time configuration setup
  static final Map<Flavor, EnvironmentConfig> _configs = {
    Flavor.dev: EnvironmentConfig(title: 'NagwaTask Dev', secureEnvKeysManger: DevSecureKeys()),
    Flavor.prod: EnvironmentConfig(title: 'NagwaTask', secureEnvKeysManger: ProdSecureKeys()),
  };

  static EnvironmentConfig? get config {
    if (appFlavor == null) {
      throw Exception('App flavor is not set!');
    }
    return _configs[appFlavor];
  }

  static String get name => appFlavor?.name ?? '';
  static String get title => config?.title ?? 'Unknown';
  //static String get sentryDNS => config?.secureEnvKeysManger.sentryDNS ?? 'Unknown';
  static String get baseUrl => config?.secureEnvKeysManger.baseUrl ?? 'Unknown';
}
