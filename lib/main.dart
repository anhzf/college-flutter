import 'package:flutter/material.dart';

final appBar = AppBar(
  title: Text('K3519010 - Media Query'),
  backgroundColor: Colors.grey.shade700,
);

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: appBar,
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
      child: MediaQuery.of(ctx).orientation == Orientation.portrait
          ? Column(children: generateSquares(ctx))
          : Row(children: generateSquares(ctx)),
    );
  }

  generateSquares(BuildContext ctx) {
    const double DEFAULT_SQUARE_SIZE = 100;
    final isPortrait = MediaQuery.of(ctx).orientation == Orientation.portrait;
    final defaultWidth = isPortrait ? null : DEFAULT_SQUARE_SIZE;
    final defaultHeight = isPortrait ? DEFAULT_SQUARE_SIZE : null;
    final sizeRest = DEFAULT_SQUARE_SIZE * 2;

    return <Widget>[
      Container(
        color: Colors.red,
        width: defaultWidth,
        height: defaultHeight,
      ),
      Container(
        color: Colors.green,
        width: isPortrait ? null : (MediaQuery.of(ctx).size.width - sizeRest),
        height: isPortrait
            ? (MediaQuery.of(ctx).size.height -
                sizeRest -
                appBar.preferredSize.height)
            : null,
      ),
      Container(
        color: Colors.blue,
        width: defaultWidth,
        height: defaultHeight,
      ),
    ];
  }
}
