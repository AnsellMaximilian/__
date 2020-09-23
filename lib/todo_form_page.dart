import 'package:flutter/material.dart';

class TodoFormPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Add New Todo')
    ),
    body: Center(
      child: TodoForm()
    ),
  );
  }
}

class TodoForm extends StatefulWidget{
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm>{

  final _formKey = GlobalKey<FormState>();
  final controllerTask = TextEditingController();
  final controllerSub = TextEditingController();

  @override
  void dispose(){
    controllerTask.dispose();
    controllerSub.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
  return Form(
    key: _formKey,
    child: Column(
      children: <Widget>[
        TextFormField(
          validator: (value) => value.isEmpty ? "Dumb" : null,
          controller: controllerTask,
          decoration: InputDecoration(labelText: "Task"),
        ),
        TextFormField(
          validator: (value) => value.isEmpty ? "Dumb" : null,
          controller: controllerSub,
          decoration: InputDecoration(labelText: "Subtitle"),
        ),
        RaisedButton(
          onPressed: (){ 
            if(_formKey.currentState.validate()){
              return showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text(controllerTask.text),
                  );
                }
              );
              // Navigator.pop(context);
            }
          },
          child: Text('Submit')
        )
      ],
    ),
  );
  }
}