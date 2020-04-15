import 'package:flutter/material.dart';

class Todo {
  int id;
  String title;
  String body;
  int completed;
  Color color = Colors.deepOrangeAccent;
  Icon icon;
  Todo({this.title, this.body, this.completed, this.icon});
}
