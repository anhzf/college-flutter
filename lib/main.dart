import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - ListView'),
            backgroundColor: Colors.grey.shade700,
          ),
          body: MyApp(),
          backgroundColor: Colors.grey.shade900,
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MyList();
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var myList = ['asdas'];

  @override
  Widget build(BuildContext ctx) {
    return ListView(
      children: [
        ...myList.asMap().entries.map((e) => ListTile(
              tileColor: Colors.white,
              title: Text('${e.key} - ${e.value} ${e.hashCode}'),
              trailing: TextButton(
                child: Icon(
                  Icons.close,
                  color: Colors.grey[300],
                ),
                onPressed: () => deleteItem(e.key),
              ),
            )),
        ListTile(
          leading: Icon(Icons.add),
          tileColor: Colors.grey[50],
          title: Text('Tambah item'),
          onTap: addItem,
        ),
      ],
    );
  }

  void addItem() {
    setState(() {
      myList.add('asdasdasd');
    });
  }

  void deleteItem(int i) {
    setState(() {
      myList.removeAt(i);
    });
  }
}
