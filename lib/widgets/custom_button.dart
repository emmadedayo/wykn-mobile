import 'package:flutter/material.dart';
import 'package:wykn/utils/helper_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.containerHeight,
    required this.containerWidth,
    required this.buttonText,
    required this.buttonTextSize,
    required this.onTap,
    this.color,
    this.radius = 4.0,
    this.gradient,
    required this.textColor,
  }) : super(key: key);

  final double containerHeight;
  final double containerWidth;
  final String buttonText;
  final double buttonTextSize;
  final Color? color; // Allow null for gradient usage
  final Gradient? gradient; // Allow null for single color usage
  final Color textColor;
  final double radius;
  final VoidCallback onTap;

  BoxDecoration _buildDecoration() {
    if (gradient != null) {
      return BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        gradient: gradient,
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: color,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: _buildDecoration(),
        child: Center(
          child: Text(
            buttonText,
            //textColor, 14, FontWeight.w700)
            style: HelperStyle.textStyle(color: textColor, fontSize: 14, weight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
