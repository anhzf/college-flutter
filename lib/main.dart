import 'package:flutter/material.dart';
import '/pages/Login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(ctx) {
    return MaterialApp(
      home: PageLogin(),
      color: Colors.white,
    );
  }
}
