import 'package:flutter/material.dart';

class TodoItemModel {
  String? text = "";
  Color? color = Colors.black;
  bool? isDone = false;

  TodoItemModel({
    this.text,
    this.color,
    this.isDone,
  });
}
