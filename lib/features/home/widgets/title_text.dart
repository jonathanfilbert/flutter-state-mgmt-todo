import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Todo List",
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}
