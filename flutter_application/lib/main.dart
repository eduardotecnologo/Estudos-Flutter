import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        appBar: AppBar(
        title: Text('app'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('app'),
        ),
      ),
    );
  }
}