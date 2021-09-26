import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.grey.shade700,
            leading: Icon(Icons.adb),
            title: Text('K3519010 - AppBar Gradiasi'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple.shade900, Colors.grey.shade900],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
                image: DecorationImage(
                  image: AssetImage('assets/img/appbar-pattern.png'),
                  fit: BoxFit.none,
                  repeat: ImageRepeat.repeat,
                ),
              ),
            ),
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
