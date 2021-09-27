import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - TextField Widget'),
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
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: firstNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(color: Colors.white70),
              ),
              onChanged: (v) => setState(() {}),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: lastNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.white70),
              ),
              onChanged: (v) => setState(() {}),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          Text(
            'Fullname: ${firstNameController.text} ${lastNameController.text}',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
