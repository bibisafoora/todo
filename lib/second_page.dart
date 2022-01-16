import 'package:flutter/material.dart';
import 'package:todo/third_page.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  List<String> item = [
    "Personal List",
    "Shopping List",
    "Movies to watch",
    "Get a haircut",
    "Things to Do",
    "Realmac",
    "Weather"
  ];

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (final items in widget.item)
            Card(
              color: Colors.blue,
              key: ValueKey(items),
              elevation: 2,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdPage()));
                },
                title: Text(items),
              ),
            ),
        ],
        onReorder: reorderData,
      ),
    );
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.item.removeAt(oldindex);
      widget.item.insert(newindex, items);
    });
  }

  void sorting() {
    setState(() {
      widget.item.sort();
    });
  }
}
