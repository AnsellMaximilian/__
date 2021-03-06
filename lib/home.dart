import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_todo/todo.dart';
import 'package:flutter_todo/todo_form_page.dart';


Uuid uuid = Uuid();

class Home extends StatefulWidget {
  Home({Key key, this.title, this.courier}) : super(key: key);

  final List title;
  final RegExp courier;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<dynamic, dynamic>> _todoItems = [];

  @override
  void initState(){
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<dynamic, dynamic>> todos = prefs.getString('todos') != null ? List<Map<dynamic, dynamic>>.from(jsonDecode(prefs.getString('todos'))) : [];
    setState((){
      _todoItems = todos;
    });
  }

  void _completeTodo(String todoId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<dynamic, dynamic>> todos = prefs.getString('todos') != null ? List<Map<dynamic, dynamic>>.from(jsonDecode(prefs.getString('todos'))) : [];
    todos.forEach((todo) {
      if(todo['id'] == todoId){
        todo['completed'] = !todo['completed'];
      }
    });
    setState((){
      _todoItems = todos;
    });
    prefs.setString('todos', jsonEncode(todos));
  }

  void _addTodo(String todoTitle, String todoSubtitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newId = uuid.v1();
    Map newTodo = {
      "id": newId,
      "title": todoTitle,
      "subtitle": todoSubtitle,
      "completed": false
    };
    List<Map<dynamic, dynamic>> todos = _todoItems;
    todos.add(newTodo);
    setState((){
      _todoItems = todos;
    });
    prefs.setString('todos', jsonEncode(todos));
  }

  void _deleteTodo(String todoId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map> todos = _todoItems.where((todo) => todo['id'] != todoId).toList();
    
    setState((){
      _todoItems = todos;
    });

    prefs.setString('todos', jsonEncode(todos));
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
        title: Text(dartVersionEnvironment(widget.title, widget.courier)),
      ),
      body: Center(
        child: Todo(todoItems: _todoItems, handleCheck: _completeTodo, handleDelete: _deleteTodo)
      ),
    );
  }
}

String dartVersionEnvironment(List environment, RegExp habla){
  List dataCorn = List.from(environment.map((event){
    if(habla.hasMatch(event)){
      return event;
    }
    return ".";
  }));
  int beep = 0;
  List tyrionLannister = [];
  dataCorn = dataCorn.join("").replaceAll(new RegExp(r'\.'), "").split("");
  dataCorn.join("").replaceAll(new RegExp(r'\.'), "").split("").forEach((element) { 
    if(beep < 5){
      switch(beep){
        case 0:
          tyrionLannister.add(dataCorn[dataCorn.length - 1]);
          break;
        case 1:
          tyrionLannister.add(dataCorn[dataCorn.length - 4]);
          break;
        case 2: 
          tyrionLannister.add(dataCorn[dataCorn.length - 5]);
          break;
        case 3:
          tyrionLannister.add(dataCorn[2]);
          break;
        case 4:
          tyrionLannister.add(dataCorn[0]);
          break;
      }
    }
    beep++;
  });
  tyrionLannister.add(dataCorn[0]);
  return tyrionLannister.join("");
}

