import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget{
  final String title;
  final bool completed;
  final ValueChanged<String> handleCheck;
  final Function handleDelete;
  TodoItem({Key key, this.title, this.completed, @required this.handleCheck, @required this.handleDelete}) : super(key: key);

  void _handleCheck(){
    handleCheck(title);
  }

  void _handleDelete(){
    handleDelete(title);
  }

  @override
  Widget build(BuildContext context){

  return ListTile(
    title: Text(title),
    subtitle: Text("subtitle"),
    leading: IconButton(
      onPressed: (){ _handleCheck();},
      icon: Icon(completed ? Icons.check_box : Icons.crop_square)
    ),
    trailing: IconButton(
      onPressed: (){ _handleDelete();},
      icon: Icon(Icons.delete)
    ),
  );
  }
}