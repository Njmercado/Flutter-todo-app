import 'dart:ui';

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {

  DropDown({Key key, this.onIconChange}): super(key: key);
  final Function(Icon) onIconChange;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  final List<String> _icons = [ 'call', 'check', 'default'];
  String _chosenIcon = 'default';

  void _onChangeIcon(String icon) {
    setState(() {
      _chosenIcon = icon;

      switch(icon) {
        case 'call':
        widget.onIconChange(Icon(
          Icons.call,
          color: Colors.white,
        ));
        break;
        case 'check':
        widget.onIconChange(Icon(
          Icons.check,
          color: Colors.white,
        ));
        break;
        default:
        widget.onIconChange(Icon(
          Icons.check,
          color: Colors.white,
        ));
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _chosenIcon,
      icon: Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: Colors.black38),
      underline: Container(
        height: 1,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String icon) {
        _onChangeIcon(icon);
      },
      items: _icons.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            width: 128,
            margin: EdgeInsets.all(16),
            child: Text(value)
          ),
        );
      }).toList(),
    );
  }
}
