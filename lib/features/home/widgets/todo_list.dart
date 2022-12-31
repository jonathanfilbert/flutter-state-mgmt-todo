import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_todo/features/home/widgets/todo_item.dart';
import 'package:latihan_todo/shared/bloc/home/home_cubit.dart';

import '../model/todo_item_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  List<Widget> _generateTodos(List<TodoItemModel> todos, BuildContext context) {
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
              context.read<HomeCubit>().checkTodo(todo);
            },
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<TodoItemModel> todoItems = context.read<HomeCubit>().todos;
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            scrollDirection: Axis.vertical,
            children: _generateTodos(todoItems, context),
          ),
        );
      },
    );
  }
}
