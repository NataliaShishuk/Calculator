import 'package:flutter/material.dart';
import 'package:calculator/CalculatorButton.dart';

class ButtonModel {
  const ButtonModel({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  });

  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function()? onPressed;
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({Key? key, required this.buttons}) : super(key: key);

  final List<ButtonModel> buttons;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [...buttons.map((button) => createButton(button))],
    );
  }

  Widget createButton(ButtonModel button) {
    return CalculatorButton(
      text: button.text,
      width: 67,
      height: 67,
      size: 25,
      backgroundColor: button.backgroundColor,
      foregroundColor: button.foregroundColor,
      onPressed: button.onPressed,
    );
  }
}
