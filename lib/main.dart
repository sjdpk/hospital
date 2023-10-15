import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/src/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:hospital/src/features/lab/presentation/bloc/lab_bloc.dart';
import 'src/config/env/env.dart';
import 'src/config/router/routes.dart';

Environment appEnv = Environment();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DoctorFormBloc>(create: (BuildContext context) => DoctorFormBloc()),
        BlocProvider<LabFormBloc>(create: (BuildContext context) => LabFormBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hospital System",
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.homeRoute,
      ),
    );
  }
}
