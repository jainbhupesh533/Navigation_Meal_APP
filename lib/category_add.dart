import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:strcolor/strcolor.dart';

class NewCategory extends StatefulWidget {
  final Function addCx;
  NewCategory(this.addCx);
  @override
  _NewCategoryState createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final _titleInput = TextEditingController();
  final _colorInput = TextEditingController();
  // final String id;

  void _checkedData() {
    if (_colorInput.text.isEmpty) {
      return;
    }

    if (_titleInput.text.isEmpty) {
      return;
    }
  }

  void _submitData() {
    Color enteredColor;
    if (_colorInput.text.isEmpty) {
      enteredColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
    } else {
      enteredColor = _colorInput.text.color();
      // print(enteredColor);
    }

    final enteredTitle = _titleInput.text;

    if (enteredTitle.isEmpty) {
      return;
    }

    widget.addCx(
      enteredTitle,
      enteredColor,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 8,
        child: Container(
          // height: (MediaQuery.of(context).size.height)/2,
          // padding: const EdgeInsets.all(10),
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: _titleInput,
                onSubmitted: (_) => _checkedData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Color',
                  fillColor: Colors.black,
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: _colorInput,
                onSubmitted: (_) => _checkedData(),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              FloatingActionButton.extended(
                icon: Icon(Icons.save),
                label: Text("Save"),
                foregroundColor: Colors.white,
                tooltip: 'Save',
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
