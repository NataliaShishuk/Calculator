import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      required this.text,
      required this.width,
      required this.height,
      required this.size,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.onPressed,
      })
      : super(key: key);

  final String text;
  final double width;
  final double height;
  final double size;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      child: SizedBox(
        width: width,
        height: height,
        child: FloatingActionButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: foregroundColor, fontSize: size),
          ),
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
