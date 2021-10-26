import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PageMain(),
        theme: ThemeData.dark(),
      ),
    );

class PageMain extends StatelessWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabBar = TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.home_filled),
        ),
        Tab(
          icon: Icon(Icons.person),
        ),
      ],
      indicator: BoxDecoration(
        color: Colors.green.withOpacity(.6),
        border: Border(
          top: BorderSide(color: Colors.red, width: 4),
        ),
      ),
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('K3519010 - Custom TabBar in AppBar'),
          bottom: PreferredSize(
            child: tabBar,
            preferredSize: Size.fromHeight(
              tabBar.preferredSize.height,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('My Account'),
            ),
          ],
        ),
      ),
    );
  }
}
