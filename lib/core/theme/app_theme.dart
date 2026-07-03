import 'package:flutter/material.dart';

class AppTheme {

  const AppTheme._();

  static const String jetBrainsMono = 'JetBrainsMono';
  static const String inter = 'Inter';

  static ThemeData get themeData => ThemeData(
    colorSchemeSeed: Colors.blue,
    scaffoldBackgroundColor: Colors.blueAccent.shade100.withAlpha(125),
    textTheme: _textTheme
  );

  static TextTheme get _textTheme => const TextTheme(
    titleLarge: TextStyle(
      fontSize: 26,
      fontWeight: .bold,
      fontFamily: jetBrainsMono
    ),
    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: .bold,
      fontFamily: jetBrainsMono
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: .w400,
      fontFamily: inter
    ),

  );


}