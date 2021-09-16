import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Event Handling'),
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
    );
  }
}
