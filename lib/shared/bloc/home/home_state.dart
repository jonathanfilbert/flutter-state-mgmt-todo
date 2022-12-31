part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  final List<TodoItemModel> todos;

  HomeInitial({required this.todos});
}
