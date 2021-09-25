import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Spacer'),
            backgroundColor: Colors.grey.shade700,
          ),
          body: MyApp(),
          backgroundColor: Colors.grey.shade900,
        ),
        color: Colors.white,
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Row(
        children: [
          Spacer(flex: 1),
          Container(width: 80, height: 80, color: Colors.red),
          Spacer(flex: 2),
          Container(width: 80, height: 80, color: Colors.green),
          Spacer(flex: 3),
          Container(width: 80, height: 80, color: Colors.blue),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
