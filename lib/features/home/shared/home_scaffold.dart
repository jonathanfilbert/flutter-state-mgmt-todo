import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_todo/features/home/model/todo_item_model.dart';
import 'package:latihan_todo/features/home/shared/widgets/floating_cta.dart';
import 'package:latihan_todo/features/home/shared/widgets/input_bottom_sheet.dart';
import 'package:latihan_todo/shared/bloc/home/home_cubit.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;

  const HomeScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleAddTask() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return InputBottomSheet(
            onSubmit: (TodoItemModel newTodo) {
              context.read<HomeCubit>().addTodos(newTodo);
              Navigator.of(context).pop();
            },
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: body,
      ),
      floatingActionButton: FloatingCta(
        onTap: () => _handleAddTask(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
