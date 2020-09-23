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
                MaterialPageRoute(builder: (context) => TodoFormPage())
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
        child: Todo()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
