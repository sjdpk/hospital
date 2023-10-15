import 'package:flutter/material.dart';
import 'package:hospital/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:hospital/src/features/doctor/presentation/screens/screens.dart';

class AppRoutes {
  static const String homeRoute = "/";
  static const String labRoute = "/lab";
  static const String doctorRoute = "/doctor";
  static const String reportRoute = "/report";
  static const String resultRoute = "/result";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.doctorRoute:
        return MaterialPageRoute(builder: (_) => DoctorHomeScreen());
      case AppRoutes.reportRoute:
        return MaterialPageRoute(builder: (_) => const ReportScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
    }
  }
}
