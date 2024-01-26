import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText == "C"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if(buttonText == "."){
      if(_output.contains(".")){
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if(buttonText == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "*"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget calculatorButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Calucation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(output,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),),
          ),
          const Expanded(child: Divider()),
          Row(
            children: [
              calculatorButton('7'),
              calculatorButton('8'),
              calculatorButton('9'),
              calculatorButton('/')
            ],
          ),
          Row(
            children: [
              calculatorButton('4'),
              calculatorButton('5'),
              calculatorButton('6'),
              calculatorButton('*')
            ],
          ),
          Row(
            children: [
              calculatorButton('1'),
              calculatorButton('2'),
              calculatorButton('3'),
              calculatorButton('-')
            ],
          ),
          Row(children: <Widget>[
              calculatorButton("."),
              calculatorButton("0"),
              calculatorButton("00"),
              calculatorButton("+"),
            ]),
          Row(
            children: [
              calculatorButton("C"),
              calculatorButton("="),
            ],
          )
        ],
      ),
    );
  }
}