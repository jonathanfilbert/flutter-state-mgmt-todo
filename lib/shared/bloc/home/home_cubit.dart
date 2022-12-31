import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../features/home/model/todo_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<TodoItemModel> todos = [];

  HomeCubit() : super(HomeInitial(todos: const []));

  void addTodos(TodoItemModel todoItem) {
    todos.add(todoItem);
    emit(HomeInitial(todos: todos));
  }

  void checkTodo(TodoItemModel todoItem) {
    final List<TodoItemModel> temp = todos;
    for (var todo in temp) {
      if (identical(todo, todoItem)) {
        final bool previousVal = todo.isDone ?? false;
        todo.isDone = !previousVal;
        break;
      }
    }
    emit(HomeInitial(todos: temp));
  }
}
