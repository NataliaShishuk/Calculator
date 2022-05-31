import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // кейс подсчёта примера

  Widget calculation(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      child: SizedBox(
        width: 67.0,
        height: 67.0,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              history(btntxt);
            });
          },
          child: Text(
            btntxt,
            style: TextStyle(color: txtcolor, fontSize: 25),
          ),
          shape: CircleBorder(
            side: BorderSide(width: 1, color: Colors.grey.shade900),
          ),
          backgroundColor: btncolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(Icons.menu_sharp),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    result,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // widget Sum
            children:  [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '${Sum()}',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calculation('C', Colors.grey.shade900, Colors.amber.shade900),
              // add logic for widget '()'
              calculation('()', Colors.grey.shade900, Colors.red.shade200),
              calculation('%', Colors.grey.shade900, Colors.red.shade200),
              // error with icon widget
              calculation('÷', Colors.grey.shade900, Colors.red.shade200),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calculation('7', Colors.grey.shade900, Colors.blue.shade200),
              calculation('8', Colors.grey.shade900, Colors.blue.shade200),
              calculation('9', Colors.grey.shade900, Colors.blue.shade200),
              // error with icon widget
              calculation('×', Colors.grey.shade900, Colors.red.shade200),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calculation('4', Colors.grey.shade900, Colors.blue.shade200),
              calculation('5', Colors.grey.shade900, Colors.blue.shade200),
              calculation('6', Colors.grey.shade900, Colors.blue.shade200),
              calculation('-', Colors.grey.shade900, Colors.red.shade200),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calculation('1', Colors.grey.shade900, Colors.blue.shade200),
              calculation('2', Colors.grey.shade900, Colors.blue.shade200),
              calculation('3', Colors.grey.shade900, Colors.blue.shade200),
              calculation('+', Colors.grey.shade900, Colors.red.shade200),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calculation('+/-', Colors.grey.shade900, Colors.red.shade200),
              calculation('0', Colors.grey.shade900, Colors.blue.shade200),
              calculation('·', Colors.grey.shade900, Colors.red.shade200),
              calculation('=', Colors.red.shade200, Colors.grey.shade900),
            ],
          ),
        ],
      ),
    );
  }

  static String result = '';

  void history(String btntxt) {
    if (btntxt == 'C') {
      result = '';
    }
    // delete widhet '='
    else{
      result += btntxt;
    }
  }

  dynamic Sum(){
    dynamic sum = 0;

    if(result.endsWith('=')){
      sum = result.interpret();
    }
    else{
      sum = 0;
    }

    return sum;
  }
  // String result = '5';

  /* String history(String symbol) {
    String line = '';

    result = line + symbol;

    line = result;

    return result;
  }
  */
}
