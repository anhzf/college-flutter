import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        theme: ThemeData.dark(),
      ),
    );

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K3519010 - Project Name'),
      ),
      body: child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MainLayout(
      child: Center(
        child: ElevatedButton(
          child: Text('Klik'),
          onPressed: () => showDialog<String>(
            context: ctx,
            builder: (BuildContext ctx) => AlertDialog(
              content: Text('asdadasd'),
              actions: [
                TextButton(
                  child: Text('Tutup'),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
