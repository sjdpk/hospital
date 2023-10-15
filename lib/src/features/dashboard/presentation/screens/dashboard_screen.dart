import 'package:flutter/material.dart';
import 'package:hospital/src/config/router/routes.dart';
import 'package:hospital/src/core/resources/colors.dart';
import 'package:hospital/src/core/widgets/button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Welcome to",
                style: TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                    text: "\n\t Hospital System \t ",
                    style: TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "\nLab and Doctor Portal",
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.08),
            AppButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.doctorRoute),
              icon: Icons.local_hospital,
              title: "Login as Doctor",
            ),
            const SizedBox(height: 40),
            AppButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.labRoute),
              icon: Icons.science_rounded,
              title: "Login as Lab Technician",
              color: labColor,
            ),
          ],
        ),
      ),
    );
  }
}
