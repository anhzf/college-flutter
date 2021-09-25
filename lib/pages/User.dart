import 'package:flutter/material.dart';
import '/pages/Login.dart';

class PageUser extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K3519010 - Halaman User'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang user 👋',
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.pushReplacement(
                  ctx,
                  MaterialPageRoute(builder: (ctx) => PageLogin()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
