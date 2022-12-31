import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_todo/shared/bloc/home/home_cubit.dart';

class AppProvider extends StatelessWidget {
  final Widget child;

  const AppProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        )
      ],
      child: child,
    );
  }
}
