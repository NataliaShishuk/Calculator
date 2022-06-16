import 'package:calculator/ButtonsRow.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  _CalculatorState();

  Color appBarTextColor = Colors.white;
  Color appBackgroundColor = Colors.black;
  Color sumTextColor = Colors.grey;
  Color buttonBackgroundColor = Colors.grey.shade900;
  Color operationButtonColor = Colors.red.shade200;
  Color digitButtonColor = Colors.blue.shade200;
  Color clearButtonColor = Colors.amber.shade900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: appBarTextColor),
        ),
        backgroundColor: appBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runAlignment: WrapAlignment.end,
              alignment: WrapAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    history,
                    style: TextStyle(color: appBarTextColor, fontSize: 30),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  sum,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: sumTextColor, fontSize: 40),
                ),
              ),
            ],
          ),
          ButtonsRow(buttons: [
            ButtonModel(
                text: 'C',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: clearButtonColor,
                onPressed: () => setState(() => clearAll())),
            ButtonModel(
                text: 'del',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: operationButtonColor,
                onPressed: () => setState(() => deleteLastItem())),
            ButtonModel(
                text: '%',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: operationButtonColor,
                onPressed: () => setState(() => appendToHistory('%'))),
            ButtonModel(
                text: '÷',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: operationButtonColor,
                onPressed: () => setState(() => appendToHistory('÷'))),
          ]),
          const SizedBox(height: 5),
          ButtonsRow(buttons: [
            ButtonModel(
                text: '7',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('7'))),
            ButtonModel(
                text: '8',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('8'))),
            ButtonModel(
                text: '9',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('9'))),
            ButtonModel(
                text: '×',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: operationButtonColor,
                onPressed: () => setState(() => appendToHistory('×'))),
          ]),
          const SizedBox(height: 5),
          ButtonsRow(buttons: [
            ButtonModel(
                text: '4',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('4'))),
            ButtonModel(
                text: '5',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('5'))),
            ButtonModel(
                text: '6',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('6'))),
            ButtonModel(
                text: '-',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: operationButtonColor,
                onPressed: () => setState(() => appendToHistory('-'))),
          ]),
          const SizedBox(height: 5),
          ButtonsRow(buttons: [
            ButtonModel(
                text: '1',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('1'))),
            ButtonModel(
                text: '2',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('2'))),
            ButtonModel(
                text: '3',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('3'))),
            ButtonModel(
                text: '+',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: operationButtonColor,
                onPressed: () => setState(() => appendToHistory('+'))),
          ]),
          const SizedBox(height: 5),
          ButtonsRow(buttons: [
            ButtonModel(
                text: 'x²',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('²'))),
            ButtonModel(
                text: '0',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('0'))),
            ButtonModel(
                text: '.',
                backgroundColor: buttonBackgroundColor,
                foregroundColor: digitButtonColor,
                onPressed: () => setState(() => appendToHistory('.'))),
            ButtonModel(
                text: '=',
                backgroundColor: operationButtonColor,
                foregroundColor: buttonBackgroundColor,
                onPressed: () => setState(() {
                      calculateSum();
                      replaceHistory(sum);
                      clearSum();
                    })),
          ]),
        ],
      ),
    );
  }

  String history = '';
  String sum = '';

  void clearHistory() {
    history = '';
  }

  void clearSum() {
    sum = '';
  }

  void clearAll() {
    clearHistory();
    clearSum();
  }

  void appendToHistory(String action) {
    history += action;

    calculateSum();
  }

  void replaceHistory(String value) {
    history = value;
  }

  void deleteLastItem() {
    if (history.isEmpty) {
      return;
    }

    history = history.substring(0, history.length - 1);

    calculateSum();
  }

  void calculateSum() {
    String expression = history;

    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('²', '^2');

    try {
      var result = expression.interpret();

      if (isInteger(result)) {
        sum = result.toStringAsFixed(0);
      } else {
        sum = result.toString();
      }
    } catch (e) {
      clearSum();
    }
  }

  bool isInteger(num number) {
    return number is int || number == number.roundToDouble();
  }
}
