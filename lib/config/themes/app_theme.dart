import 'package:flutter/material.dart';
import '/config/index.dart';

class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    primaryColor: Constants.primaryColor,
    fontFamily: 'Prompt Light',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      color: Constants.primaryColor,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Sukhumvit',
  );
}
