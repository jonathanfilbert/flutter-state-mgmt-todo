import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_todo/shared/bloc/home/home_cubit.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final int todosCount = context.read<HomeCubit>().todos.length;
        return Text(
          "Todo List ($todosCount)",
          style: const TextStyle(
            fontSize: 24.0,
          ),
        );
      },
    );
  }
}
