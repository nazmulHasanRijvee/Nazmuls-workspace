import 'package:flutter/material.dart';

class AppTheme {

  const AppTheme._();

  static ThemeData get themeData => ThemeData(
    colorSchemeSeed: Colors.blue,
    scaffoldBackgroundColor: Colors.blueAccent.shade100.withAlpha(125),
    textTheme: _textTheme
  );

  static TextTheme get _textTheme => const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: .bold
    )
  );


}