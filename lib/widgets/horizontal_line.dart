import 'package:flutter/material.dart';

class ColoredHorizontalLine extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  const ColoredHorizontalLine({
    Key? key,
    required this.color,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
