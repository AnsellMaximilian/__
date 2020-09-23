import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todo_form_page.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  void _addTodo(String todoTitle){
    Map newTodo = {
      "title": todoTitle,
      "completed": false
    };
    List<Map> todoItems = _todoItems;
    todoItems.add(newTodo);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoFormPage(handleAdd: _addTodo))
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){print('you a fag');},
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Todo(todoItems: _todoItems, handleCheck: _completeTodo, handleDelete: _deleteTodo)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
