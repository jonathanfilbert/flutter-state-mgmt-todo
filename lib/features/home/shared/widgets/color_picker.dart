import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(Color color) onChooseColor;

  const ColorPicker({
    Key? key,
    required this.onChooseColor,
  }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color chosenColor = Colors.white24;
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blueAccent,
    Colors.purple,
    Colors.yellow,
  ];

  List<Widget> _renderColors() {
    final List<Widget> result = [];
    for (var col in colors) {
      final bool isChosen = col == chosenColor;

      result.add(
        GestureDetector(
          onTap: () {
            widget.onChooseColor(col);
            setState(() {
              chosenColor = col;
            });
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: col,
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: isChosen ? Colors.black : Colors.transparent,
                width: isChosen ? 5.0 : 0.0,
              ),
            ),
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _renderColors(),
    );
  }
}
