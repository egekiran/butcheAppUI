import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(ButcheApp());
}

class ButcheApp extends StatelessWidget {
  const ButcheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'butche',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}
