import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SlidableList(),
    );
  }
}

class SlidableList extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              title: Text(items[index]),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.blue,
                icon: Icons.edit,
                onTap: () => _showSnackBar(context, 'Edit ${items[index]}'),
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _showSnackBar(context, 'Delete ${items[index]}'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
