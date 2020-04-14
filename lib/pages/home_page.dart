import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/components/dialogToCreateNote.dart';
import 'package:f_202010_todo_class/components/todo.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = List<Todo>.generate(100, (i) => new Todo(title: "title", body: "excuse me careverga"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _openDialog();
        }, 
        tooltip: 'Add task', 
        child: new Icon(Icons.add)
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return Dismissible(
          background: _dismissibleBackground(),
          key: new ObjectKey(element),
          onDismissed: (direction) {
            setState(() {
              todos.removeAt(posicion);
            });
          },
          child: TodoWidget(todo: element)
        );
      },
    );
  }

  Widget _dismissibleBackground() {
    return Container(
      color: Colors.redAccent,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            "deleted",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          )
        ]
      )
    );
  }

  void _addTodo(Todo todo) {
    setState(() {
      todos.add(todo);
    });
  }

  Future _openDialog() {
    return showDialog(
      context: context,
      child: CreateNote(
        onTodoChange: (todo) {
          _addTodo(todo);
        },
      )
    );
  }
}
