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
        buttonColor: Colors.lightGreen,
        canvasColor: Colors.amberAccent,
        cardColor: Colors.white70,
        cardTheme: CardTheme(elevation: 12 , shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),  shadowColor: Colors.grey.shade400, ),


        primarySwatch: Colors.lightGreen,
      ),
      home: MisArduino(),
    );
  }
}


