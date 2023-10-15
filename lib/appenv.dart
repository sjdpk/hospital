//@desc : specify which env shuould run
import 'src/config/env/env.dart';

/// Enum representing available application environments.
/// - `prod`: Production environment with production-related APIs and keys.
/// - `dev`: Development/testing environment with development/testing-related APIs and keys.
/// - `local`: Local environment with local-related APIs and keys.
const applicationEnv = Environment.dev;
