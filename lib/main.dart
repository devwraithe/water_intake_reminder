import 'package:flutter/material.dart';
import 'package:water_intake_reminder/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Helvetica',
      ),
      home: const MyHomePage(),
    );
  }
}
