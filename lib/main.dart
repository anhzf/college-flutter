import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Card Widget'),
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: ListView(
          children: [
            ListItem(Icons.tune, 'General'),
            ListItem(Icons.account_circle, 'Account'),
            ListItem(Icons.notifications, 'Notifications'),
            ListItem(Icons.language, 'Language & region'),
            ListItem(Icons.info, 'About'),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  IconData icon;
  String label;

  ListItem(this.icon, this.label);

  @override
  Widget build(ctx) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            Icon(icon),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
