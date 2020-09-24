import 'package:flutter/material.dart';
import 'package:flutter_todo/todo_item.dart';

class Todo extends StatefulWidget{
  Todo({Key key, this.todoItems, @required this.handleCheck, @required this.handleDelete}) : super(key: key);

  final List<Map> todoItems;
  final Function handleDelete;
  final Function handleCheck;
 

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo>{
  List<Widget> _buildTodoItems() {
    List<Widget> itemsList = [];
    widget.todoItems.forEach((item){ 
       itemsList.add(TodoItem(id: item['id'], title: item['title'], subtitle: item['subtitle'], completed: item['completed'], handleCheck: widget.handleCheck, handleDelete: widget.handleDelete,));
    });
    return itemsList;
  }

  @override
  Widget build(BuildContext context){
    return ListView(
      children: _buildTodoItems()
    );
  }
}