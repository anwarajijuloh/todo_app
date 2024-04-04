import 'package:flutter/material.dart';

import '../constants.dart';

ThemeData myTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: bgPrimary,
  appBarTheme: const AppBarTheme(
    backgroundColor: bgPrimary,
    foregroundColor: textPrimary,
    iconTheme: IconThemeData(
      color: textPrimary,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: myOrange,
    foregroundColor: bgPrimary,
    shape: CircleBorder(),
    iconSize: 20,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: bgPrimary,
    titleTextStyle: TextStyle(
      color: myOrange,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  useMaterial3: true,
);
