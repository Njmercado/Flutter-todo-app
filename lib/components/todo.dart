import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/todo.dart';

class TodoWidget extends StatelessWidget {

  TodoWidget({Key key, this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 16,
        right: 16,
      ),
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: todo.color,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: _buildItemContent(todo),
      )
    );
  }

  Widget _buildItemContent(Todo element) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${element.title}',
            style: TextStyle( 
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            '${element.body}',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ]
      )
    );
  }
}