import 'base_env.dart';
import 'dev_env.dart';
import 'local_env.dart';
import 'prod_env.dart';

class Environment {
  Environment._internal();
  static final Environment _singleton = Environment._internal();
  factory Environment() => _singleton;

  // Env
  static const String prod = "PROD";
  static const String dev = "DEV";
  static const String local = "LOCAL";

  late BaseEnvironment envConfig;

  // @desc : env wise data load
  initEnvConfig(String applicationEnv) {
    final String environment = String.fromEnvironment("ENV", defaultValue: applicationEnv);
    envConfig = _getEnvConfig(environment);
  }

  BaseEnvironment _getEnvConfig(String env) {
    switch (env) {
      case Environment.prod:
        return ProdEnv();
      case Environment.local:
        return LocalEnvironment();
      default:
        return DevEnvironment();
    }
  }
}
