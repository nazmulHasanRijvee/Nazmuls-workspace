import 'package:flutter/material.dart';
import 'package:flutter8_workspace/core/theme/app_theme.dart';
import 'package:flutter8_workspace/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nazmuls Workspace',
      theme: AppTheme.themeData,
      home: const HomeScreen()
    );
  }
}
