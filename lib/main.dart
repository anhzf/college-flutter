import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Draggable Widget'),
            backgroundColor: Colors.grey.shade700,
          ),
          body: MyApp(),
          backgroundColor: Colors.grey.shade900,
        ),
        color: Colors.white,
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Color defaultDraggableTargetColor =
      Colors.grey.shade300.withOpacity(.8);
  Color draggableTargetColor = defaultDraggableTargetColor;
  bool isDragAccepted = false;

  @override
  Widget build(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Draggable<Color>(
              data: Colors.red.shade500,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.red.shade500,
                  elevation: 3,
                  shape: StadiumBorder(),
                ),
              ),
              feedback: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.red.shade500.withOpacity(.6),
                  elevation: 3,
                  shape: StadiumBorder(),
                ),
              ),
              childWhenDragging: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.red.shade500.withOpacity(.1),
                  elevation: 0,
                  shape: StadiumBorder(),
                ),
              ),
            ),
            Draggable<Color>(
              data: Colors.green.shade500,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.green.shade500,
                  elevation: 3,
                  shape: StadiumBorder(),
                ),
              ),
              feedback: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.green.shade500.withOpacity(.6),
                  elevation: 3,
                  shape: StadiumBorder(),
                ),
              ),
              childWhenDragging: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.green.shade500.withOpacity(.1),
                  elevation: 0,
                  shape: StadiumBorder(),
                ),
              ),
            ),
            Draggable<Color>(
              data: Colors.blue.shade500,
              child: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.blue.shade500,
                  elevation: 3,
                  shape: StadiumBorder(),
                ),
              ),
              feedback: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.blue.shade500.withOpacity(.6),
                  elevation: 3,
                  shape: StadiumBorder(),
                ),
              ),
              childWhenDragging: SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  color: Colors.blue.shade500.withOpacity(.1),
                  elevation: 0,
                  shape: StadiumBorder(),
                ),
              ),
            ),
          ],
        ),
        DragTarget<Color>(
          builder: (ctx, accepted, rejected) => SizedBox(
            width: 100,
            height: 100,
            child: Material(
              color: draggableTargetColor,
              shape: StadiumBorder(),
            ),
          ),
          onAccept: (data) {
            isDragAccepted = true;
            draggableTargetColor = data;
          },
        ),
        TextButton(
          onPressed: () => setState(() {
            draggableTargetColor = defaultDraggableTargetColor;
          }),
          child: Text('Reset'),
        )
      ],
    );
  }
}
