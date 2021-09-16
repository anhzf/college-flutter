import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Custom Font'),
            backgroundColor: Colors.grey.shade700,
          ),
          body: MyApp(),
          backgroundColor: Colors.grey.shade900,
        ),
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
