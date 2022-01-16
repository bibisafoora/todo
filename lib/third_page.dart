import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'home.dart';

class ThirdPage extends StatefulWidget {
 //final Home home;

  final home = Home();
  List<String> item = ["My Lists","Themes","Tips & Tricks","Follow the Team",
    "Newsletter","Realmac", "Weather"];


  ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page'),),
      body:
      ReorderableListView(
        children: <Widget>[

          for (final items in widget.item)
            Card(
              color: Colors.blue,
              key: ValueKey(items),
              elevation: 2,
              child: ListTile(

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

  void delete( value) {
    setState(() {
      widget.item.remove(value);
    });
  }
}
