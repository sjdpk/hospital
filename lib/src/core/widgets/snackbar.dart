// This file defines the AppSnackbar class, which provides a utility for displaying
// custom snackbars or toast-like messages with various customization options.

import 'package:flutter/material.dart';
import 'package:hospital/src/core/resources/colors.dart';

enum AppSnackBarType {
  sucess,
  error,
  info
}

const shrink = Offstage();

class AppSnackbar {
  /// @desc: Displays a custom snackbar or a toast-like message.
  ///
  /// You can customize the appearance of the snackbar using different options
  ///
  /// parameters like [labelText], [backgroundColor], [textColor], [fontSize], [duration] etc.
  ///
  /// Here duration is in second,fondefault font size = 14
  static void show(
    BuildContext context,
    String message, {
    GlobalKey<ScaffoldMessengerState>? snackbarKey,
    String? labelText,
    Color? backgroundColor,
    Color? textColor,
    double fontSize = 14,
    Color? labelTextColor,
    void Function()? labelFunction,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    int duration = 1, //in second
    Widget? leading,
    Widget? suffix,
    Widget? contentWidget,
    TextStyle? style,
    AppSnackBarType? type,
    dynamic length,
  }) {
    if (type == AppSnackBarType.sucess) {
      backgroundColor = Colors.green;
    } else if (type == AppSnackBarType.error) {
      backgroundColor = Colors.red;
    } else if (type == AppSnackBarType.info) {
      backgroundColor = primaryColor;
    }

    SnackBarAction? snackBarAction;
    if (labelText != null) {
      snackBarAction = SnackBarAction(
        label: labelText,
        textColor: labelTextColor,
        onPressed: labelFunction ?? () {},
      );
    }

    final SnackBar snackBar = SnackBar(
      behavior: snackBarBehavior,
      margin: snackBarBehavior == SnackBarBehavior.floating ? margin : null,
      content: contentWidget ??
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading ?? shrink,
              Expanded(
                child: Text(
                  message,
                  style: style ?? TextStyle(color: textColor, fontSize: fontSize),
                ),
              ),
              suffix ?? shrink,
            ],
          ),
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor,
      action: snackBarAction,
    );
    try {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
