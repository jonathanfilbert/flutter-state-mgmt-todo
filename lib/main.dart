import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/home.dart';
import 'package:latihan_todo/features/home/shared/home_scaffold.dart';
import 'package:latihan_todo/shared/bloc/shared/app_provider.dart';
import 'package:latihan_todo/shared/theme/theme.dart';

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
  @override
  Widget build(BuildContext context) {
    TodoTheme todoTheme = TodoTheme();
    return AppProvider(
      child: MaterialApp(
        theme: todoTheme.themeData,
        home: const HomeScaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
