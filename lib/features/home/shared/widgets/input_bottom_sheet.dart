import 'package:flutter/material.dart';
import 'package:latihan_todo/features/home/shared/widgets/color_picker.dart';

import '../../model/todo_item_model.dart';

class InputBottomSheet extends StatefulWidget {
  final Function(TodoItemModel newTodo) onSubmit;

  const InputBottomSheet({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<InputBottomSheet> createState() => _InputBottomSheetState();
}

class _InputBottomSheetState extends State<InputBottomSheet> {
  Color? todoColor;
  String? todoText;

  void _handleChooseColor(Color chosenColor) {
    setState(() {
      todoColor = chosenColor;
    });
  }

  void _handleInputTodo(String todoTxt) {
    setState(() {
      todoText = todoTxt;
    });
  }

  void _handleSubmitTodo() {
    TodoItemModel newTodo =
        TodoItemModel(text: todoText, color: todoColor, isDone: false);
    widget.onSubmit(newTodo);
  }

  bool checkComplete() {
    return todoColor != null && todoText != '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 12.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      "What do you want to achieve?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Write it here...',
                    ),
                    onChanged: (String newVal) {
                      _handleInputTodo(newVal);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ColorPicker(
                    onChooseColor: (Color chosenColor) {
                      _handleChooseColor(chosenColor);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                    ),
                    onPressed: checkComplete() ? _handleSubmitTodo : null,
                    child: const Text("Submit!"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
