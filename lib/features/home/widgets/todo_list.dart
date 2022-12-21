import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/widgets/todo_item.dart';

import '../model/todo_item_model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItemModel> todos;
  final Function(TodoItemModel todoItem) onCheckTodo;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onCheckTodo,
  }) : super(key: key);

  List<Widget> _generateTodos() {
    final List<Widget> result = [];
    for (var todo in todos) {
      final bool isLast = todo == todos.last;
      result.add(
        Padding(
          padding: EdgeInsets.only(
            bottom: isLast ? 0.0 : 16.0,
          ),
          child: TodoItem(
            text: todo.text ?? '',
            color: todo.color,
            isDone: todo.isDone,
            onCheckTodo: () {
              onCheckTodo(todo);
            },
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        scrollDirection: Axis.vertical,
        children: _generateTodos(),
      ),
    );
  }
}
