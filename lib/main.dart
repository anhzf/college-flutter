import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Image Widget'),
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
    return Container(
      alignment: Alignment.center,
      child: Image(
        image: NetworkImage('https://source.unsplash.com/random/500x500'),
        fit: BoxFit.cover,
      ),
    );
  }
}
