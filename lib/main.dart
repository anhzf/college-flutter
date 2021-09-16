import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('K3519010 - Stack & Align Widget'),
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
    return MyList();
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<String> myList = [];

  @override
  Widget build(BuildContext ctx) {
    return Stack(
      children: [
        ListView(
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
          ],
        ),
        Align(
          alignment: Alignment(0, 1),
          child: Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Row(children: [Icon(Icons.add), Text('Tambah item')]),
              onPressed: addItem,
            ),
          ),
        )
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
