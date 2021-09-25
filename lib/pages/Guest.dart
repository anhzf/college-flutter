import 'package:flutter/material.dart';
import '/pages/Login.dart';

class PageGuest extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K3519010 - Halaman Guest'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini halaman guest',
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              child: Text('Kembali'),
              onPressed: () => Navigator.pushReplacement(
                ctx,
                MaterialPageRoute(builder: (ctx) => PageLogin()),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
