import 'package:flutter/material.dart';
import '/pages/User.dart';
import '/pages/Guest.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K3519010 - Ini Halaman Login'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Login sebagai user'),
              onPressed: () {
                Navigator.pushReplacement(
                  ctx,
                  MaterialPageRoute(builder: (ctx) => PageUser()),
                );
              },
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextButton(
                child: Text('Login sebagai guest'),
                onPressed: () {
                  Navigator.pushReplacement(
                    ctx,
                    MaterialPageRoute(builder: (ctx) => PageGuest()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
