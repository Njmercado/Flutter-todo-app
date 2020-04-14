import 'package:flutter/material.dart';

class Todo {
  int id;
  String title;
  String body;
  int completed;
  Color color = Colors.deepOrangeAccent;
  Todo({this.title, this.body, this.completed});
}
