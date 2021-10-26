import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PageMain(),
      ),
    );

class PageMain extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MainLayout(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(builder: (ctx) => PageSecond()),
          );
        },
        child: Hero(
          tag: 'avatar',
          child: Avatar(size: 100),
        ),
      ),
    );
  }
}

class PageSecond extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MainLayout(
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: Hero(
            tag: 'avatar',
            child: Avatar(size: 200),
          ),
        ),
      ),
    );
  }
}

class MainLayout extends StatelessWidget {
  MainLayout({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K3519010 - Hero Animation'),
        backgroundColor: Colors.grey.shade700,
      ),
      body: child,
      backgroundColor: Colors.grey.shade900,
    );
  }
}

Widget Avatar({required double size}) => ClipOval(
      child: Container(
        width: size,
        height: size,
        child: Image.network(
          'https://www.thispersondoesnotexist.com/image',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
