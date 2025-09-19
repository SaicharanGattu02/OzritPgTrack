import 'package:flutter/material.dart';

class StepCircle extends StatelessWidget {
  final int step;
  final bool active;

  const StepCircle({
    super.key,
    required this.step,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: active ? Colors.purple : Colors.grey[300],
      child: Text(
        step.toString(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class LineDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const LineDivider({
    super.key,
    this.width = 40,
    this.height = 2,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color ?? Colors.grey[300],
    );
  }
}
