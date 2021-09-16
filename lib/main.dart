import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Animated Container'),
            backgroundColor: Colors.grey.shade700,
          ),
          body: MyApp(),
          backgroundColor: Colors.grey.shade900,
        ),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const maxSize = 300;

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  Random random = Random();
  late Timer timer;

  @override
  Widget build(BuildContext ctx) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: maxSize + 100,
            height: maxSize + 100,
            alignment: AlignmentDirectional.center,
            child: AnimatedContainer(
              width: _width,
              height: _height,
              color: _color,
              duration: const Duration(milliseconds: 500),
            ),
          ),
          Text(
            'width: ${_width}px',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'height: ${_height}px',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _width = random.nextInt(maxSize).toDouble();
        _height = random.nextInt(maxSize).toDouble();
        _color = getRandomColor();
      });
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    timer.cancel();
  }

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
