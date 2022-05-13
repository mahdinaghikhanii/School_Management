import 'package:flutter/material.dart';

enum AppTheme { dark, light }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarColor: Colors.grey[100],
      textTheme: TextTheme(headline1: TextStyle(color: Colors.grey[100]))),
  AppTheme.dark: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.grey[800],
      bottomAppBarColor: Colors.grey[100],
      textTheme: const TextTheme(headline1: TextStyle(color: Colors.white70)))
};
