import 'package:flutter/material.dart';
import 'package:flutter_todo/todo_item.dart';

class Todo extends StatefulWidget{
 

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo>{
  List<Map> _todoItems = [
    {"title": "Make Sandwich", "completed": true},
    {"title": "Get Giddy Widit", "completed": false},
    {"title": "Get down", "completed": true}

  ];

  void _completeTodo(String todoTitle){
    List<Map> todoItems = _todoItems;
    todoItems.forEach((item) {
      if(item['title'] == todoTitle){
        item['completed'] = !item['completed'];
      }
    });
    setState((){
      _todoItems = todoItems;
    });
  }

  void _deleteTodo(String todoTitle){
    List<Map> todoItems = _todoItems.where((item) => item['title'] != todoTitle).toList();
    
    setState((){
      _todoItems = todoItems;
    });
  }
  
  List<Widget> _buildTodoItems() {
    List<Widget> itemsList = [];
    _todoItems.forEach((item){ 
       itemsList.add(TodoItem(title: item['title'], completed: item['completed'], handleCheck: _completeTodo, handleDelete: _deleteTodo,));
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