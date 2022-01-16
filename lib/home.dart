import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/second_page.dart';

class Home extends StatefulWidget {
  List<String> item = [
    "Go to the Gym",
    "Buy Groceries",
    "Mow the Lawn",
    "Get a haircut",
    "Pick up dry cleaning"
  ];

  List<Widget> newList = [];

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Start'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.sort_by_alpha),
                tooltip: "Sort",
                onPressed: sorting),
          ],
        ),
        body: ListView.builder(
            itemCount: widget.item.length,
            itemBuilder: (BuildContext ctx, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: Key(widget.item[index]),
                onDismissed: (_) {
                  setState(() {
                    widget.item.removeAt(index);
                  });
                },
                child: ReorderableListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    for (final items in widget.item)
                      Card(
                        color: items.length > 12 ? Colors.red : Colors.orange,
                        key: ValueKey(items),
                        elevation: 2,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage()));
                          },
                          title: Text(items),
                        ),
                      ),
                  ],
                  onReorder: reorderData,
                ),
              );
            }));
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
