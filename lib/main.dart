import 'package:flutter/material.dart';
import 'package:gmail_clone_app/ui/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Google Sans'),
      home: Home(),
    );
  }
}
