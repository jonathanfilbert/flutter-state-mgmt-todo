import 'package:flutter/material.dart';
import 'package:latihan_todo/shared/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        final num todosCount = homeProvider.getTodosCount();
        return Text(
          "TODO App ($todosCount)",
          style: const TextStyle(
            fontSize: 24.0,
          ),
        );
      },
    );
  }
}
