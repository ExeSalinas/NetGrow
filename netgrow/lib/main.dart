import 'package:flutter/material.dart';
import 'package:netgrow/MisArduinos_route.dart';
import 'package:netgrow/dashboard_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Net Grow',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.lightGreen,
      ),
      home: MisArduino(),
    );
  }
}


