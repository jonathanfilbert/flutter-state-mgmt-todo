import 'package:flutter/material.dart';

import '../../../features/home/model/todo_item_model.dart';

class HomeProvider extends ChangeNotifier {
  List<TodoItemModel> todos = [];

  num getTodosCount() {
    return todos.length;
  }

  void addTodo(TodoItemModel newTodo) {
    todos = [...todos, newTodo];
    notifyListeners();
  }

  void checkTodo(TodoItemModel todoItem) async {
    for (var todo in todos) {
      if (identical(todo, todoItem)) {
        final bool previousVal = todo.isDone ?? false;
        todo.isDone = !previousVal;
        break;
      }
    }
    notifyListeners();
  }
}
