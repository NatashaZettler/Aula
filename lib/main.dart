import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/info.dart';

// void main() => print('Hello world');

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Info(),
    );
  }
}
