import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 Flexible Widget'),
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
    return Column(
      children: [
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: Container(
                  color: Colors.green,
                  margin: EdgeInsets.all(8.0),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.yellow,
                  margin: EdgeInsets.all(8.0),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.purple,
                  margin: EdgeInsets.all(8.0),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.blue,
            margin: EdgeInsets.all(8.0),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.red,
            margin: EdgeInsets.all(8.0),
          ),
        ),
      ],
    );
  }
}
