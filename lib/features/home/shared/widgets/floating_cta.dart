import 'package:flutter/material.dart';
import 'package:latihan_todo/shared/providers/home/home_provider.dart';
import 'package:provider/provider.dart';

class FloatingCta extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingCta({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 100.0,
                  spreadRadius: 10.0,
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 12.0,
              bottom: 12.0,
              right: 32.0,
            ),
            child: Text(
              "Write something...",
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
