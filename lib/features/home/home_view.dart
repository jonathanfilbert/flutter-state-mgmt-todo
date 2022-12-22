import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/model/todo_item_model.dart';
import 'package:latihan_todo/features/home/widgets/title_text.dart';
import 'package:latihan_todo/features/home/widgets/todo_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 48.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleText(),
            const SizedBox(
              height: 12.0,
            ),
            TodoList(
              onCheckTodo: (TodoItemModel todoItem) {},
            ),
          ],
        ),
      ),
    );
  }
}
