import 'package:flutter/material.dart';
import 'package:hospital/src/core/resources/colors.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final String title;
  final Color? color;
  final double borderRadius = 4;
  final double? elevation;
  const AppButton({super.key, this.onPressed, this.icon, required this.title, this.color, this.elevation});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      onPressed: onPressed,
      color: color ?? primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: btnLabelColor,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: const TextStyle(color: btnLabelColor),
          )
        ],
      ),
    );
  }
}
