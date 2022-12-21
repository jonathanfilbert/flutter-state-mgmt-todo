import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String text;
  final Color? color;
  final bool? isDone;
  final Function onCheckTodo;

  const TodoItem({
    Key? key,
    required this.text,
    this.color = Colors.grey,
    this.isDone = false,
    required this.onCheckTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = color ?? Colors.grey;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                decoration:
                    isDone! ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
            height: 20.0,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              value: isDone,
              onChanged: (bool? newValue) {
                onCheckTodo();
              },
              activeColor: borderColor,
            ),
          ),
        ],
      ),
    );
  }
}
