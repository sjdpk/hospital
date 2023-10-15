import 'package:flutter/material.dart';
import 'appenv.dart';
import 'src/config/env/env.dart';

Environment appEnv = Environment();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appEnv.initEnvConfig(applicationEnv);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appEnv.envConfig.applicationName,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: Center(
          child: Text("Welcome to${appEnv.envConfig.applicationName}"),
        ),
      ),
    );
  }
}
