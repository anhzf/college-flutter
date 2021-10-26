import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: Text('K3519010 - AppBar with Tabs'),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_filled),
                  ),
                  Tab(
                    icon: Icon(Icons.search),
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Text('Home'),
                ),
                Center(
                  child: Text('Search and Explore'),
                ),
                Center(
                  child: Text('All notifications will be here'),
                ),
                Center(
                  child: Text('My Account'),
                ),
              ],
            ),
          ),
        ),
        theme: ThemeData.dark(),
      ),
    );
