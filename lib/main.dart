import 'package:flutter/material.dart';
import 'package:shin_todo/screen/home_screen.dart';

// void main() => runApp(MyApp())
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}