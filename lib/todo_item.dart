import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget{
  final String title, subtitle, id;
  final bool completed;
  final ValueChanged<String> handleCheck;
  final Function handleDelete;
  TodoItem({Key key, this.id, this.title, this.subtitle, this.completed, @required this.handleCheck, @required this.handleDelete}) : super(key: key);

  void _handleCheck(){
    handleCheck(id);
  }

  void _handleDelete(){
    handleDelete(id);
  }

  @override
  Widget build(BuildContext context){

  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
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