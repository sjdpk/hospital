import 'base_env.dart';

class ProdEnv implements BaseEnvironment {
  @override
  String get applicationName => "Hospital System";

  @override
  // TODO: implement baseUrl
  String get baseUrl => throw UnimplementedError();
}
