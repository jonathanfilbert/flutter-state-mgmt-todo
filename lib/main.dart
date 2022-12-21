import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/home.dart';
import 'package:latihan_todo/features/home/shared/home_scaffold.dart';
import 'package:latihan_todo/shared/theme/theme.dart';
import 'package:latihan_todo/features/home/model/todo_item_model.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<TodoItemModel> todos = [];

  @override
  Widget build(BuildContext context) {
    void _addTodo(TodoItemModel newTodo) {
      setState(() {
        todos = [...todos, newTodo];
      });
    }

    void _checkTodo(TodoItemModel todoItem) {
      final List<TodoItemModel> temp = todos;
      for (var todo in temp) {
        if (identical(todo, todoItem)) {
          final bool previousVal = todo.isDone ?? false;
          todo.isDone = !previousVal;
          break;
        }
      }
      setState(() {
        todos = [...temp];
      });
    }

    TodoTheme todoTheme = TodoTheme();
    return MaterialApp(
      theme: todoTheme.themeData,
      home: HomeScaffold(
        onAddTodo: _addTodo,
        body: HomeView(
          todos: todos,
          onCheckTodo: (TodoItemModel todoItem) {
            _checkTodo(todoItem);
          },
        ),
      ),
    );
  }
}
