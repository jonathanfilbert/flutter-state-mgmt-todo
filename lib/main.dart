import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/home.dart';
import 'package:latihan_todo/features/home/shared/home_scaffold.dart';
import 'package:latihan_todo/shared/providers/main_provider.dart';
import 'package:latihan_todo/shared/theme/theme.dart';
import 'package:latihan_todo/features/home/model/todo_item_model.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<TodoItemModel> todos = [];

  @override
  Widget build(BuildContext context) {
    TodoTheme todoTheme = TodoTheme();
    return MainProvider(
      child: MaterialApp(
        theme: todoTheme.themeData,
        home: const HomeScaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
