import 'package:flutter/material.dart';
import 'package:latihan_todo/shared/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatelessWidget {
  final Widget child;
  const MainProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: child,
    );
  }
}
