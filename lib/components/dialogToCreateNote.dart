import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/components/newTodoDropdown.dart';

class CreateNote extends StatefulWidget {

  CreateNote({Key key, @required this.onTodoChange});
  final Function(Todo) onTodoChange;

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  List<Color> _colors = [ Colors.greenAccent, Colors.deepOrangeAccent, Colors.blueAccent ];

  String _title;
  String _description;
  Color _color;
  Icon _icon;
  Todo _todo = new Todo(title: 'title', body: 'body', completed: 0, icon: Icon(Icons.check));

  void _onTitleChange(String title) {
    setState(() {
      _title = title;
      _todo.title = title;
    });
  }

  void _onDescriptionChange(String description) {
    setState(() {
      _description = description;
      _todo.body = description;
    });
  }

  void _onColorChange(Color color) {
    setState(() {
      _color = color;
      _todo.color = color;
    });
  }

  void _onIconChange(Icon icon) {
    setState(() {
      _icon = icon;
      _todo.icon = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: AlertDialog(
        contentPadding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        title: Text(
          'Add task',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: _color,
        content: _buildDialogContent(context),
        actions: _buildDialogActionButtons(),
      )
    );
  }

  List<Widget> _buildDialogActionButtons() {
    return [
      RaisedButton(
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(
          'cancel',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      RaisedButton(
        color: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(
          'accept',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        onPressed: () {
          widget.onTodoChange(_todo);
          Navigator.of(context).pop();
        },
      ),
    ];
  }

  Widget _buildDialogContent(context) {
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          TextField(
            textAlign: TextAlign.start,
            decoration: InputDecoration( border: InputBorder.none, hintText: 'title'),
            onChanged: (text) {
              _onTitleChange(text);
            },
          ),
          TextField(
            textAlign: TextAlign.start,
            decoration: InputDecoration( border: InputBorder.none, hintText: 'description'),
            maxLines: 8,
            onChanged: (text) {
              _onDescriptionChange(text);
            },
          ),
          _colorOptions(),
          DropDown(
            onIconChange: (icon){
              _onIconChange(icon);
            },
          )
        ],
      ),
    );
  }

  Widget _colorOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        for(int i = 0; i < _colors.length; i++)
          MaterialButton(
            shape: CircleBorder(side: BorderSide(width: .8)),
            elevation: 0.0,
            height: 32,
            padding: EdgeInsets.only(
              left: 1.0,
              right: 1.0
            ),
            color: _colors[i],
            onPressed: () {
              _onColorChange(_colors[i]);
            },
          ),
      ]
    );
  }
}