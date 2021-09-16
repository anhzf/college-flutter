import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: MyApp(),
          backgroundColor: Colors.black,
        ),
        color: Colors.white,
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Text(
        '+Jakarta Sans Here... 👋',
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w700,
          fontSize: 72,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
