import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - InkWell'),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Elevated button'),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          ),
          Container(
            child: Material(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: Text(
                      'Elevated button using InkWell',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
                splashColor: Colors.cyan.shade500.withOpacity(.7),
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16),
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
