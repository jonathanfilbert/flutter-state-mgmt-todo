import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/widgets/todo_item.dart';
import 'package:latihan_todo/shared/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

import '../model/todo_item_model.dart';

class TodoList extends StatelessWidget {
  final Function(TodoItemModel todoItem) onCheckTodo;

  const TodoList({
    Key? key,
    required this.onCheckTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        List<Widget> _generateTodos(List<TodoItemModel> todos) {
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
                    homeProvider.checkTodo(todo);
                  },
                ),
              ),
            );
          }
          return result;
        }

        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            scrollDirection: Axis.vertical,
            children: _generateTodos(homeProvider.todos),
          ),
        );
      },
    );
  }
}
