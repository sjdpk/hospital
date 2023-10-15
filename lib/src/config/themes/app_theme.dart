import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,

      appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      // fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      // fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }
}
