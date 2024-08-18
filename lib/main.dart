import 'package:flutter/material.dart';
import 'package:hope_orphanage/app_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const ChoiceScreen(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
