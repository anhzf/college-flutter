import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.child, required this.title})
      : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K3519010 - ${this.title}'),
      ),
      body: child,
    );
  }
}
