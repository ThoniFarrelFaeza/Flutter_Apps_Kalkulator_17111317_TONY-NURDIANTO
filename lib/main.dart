import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalcScreen(),
    );
  }
}

class CalcScreen extends StatefulWidget {
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final textFieldOne = TextEditingController();
  final textFieldTwo = TextEditingController();

  double result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              TextField(
                controller: textFieldOne,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: textFieldTwo,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('+'),
                    onPressed: () => calculate('+'),
                  ),
                  RaisedButton(
                    child: Text('-'),
                    onPressed: () => calculate('-'),
                  ),
                  RaisedButton(
                    child: Text('*'),
                    onPressed: () => calculate('*'),
                  ),
                  RaisedButton(
                    child: Text('/'),
                    onPressed: () => calculate('/'),
                  ),
                ],
              ),
              Text(
                '${result ?? ''}'
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculate(String operation) {
    final firstNumber = double.parse(textFieldOne.value.text);
    final secondNumber = double.parse(textFieldTwo.value.text);
    switch (operation) {
      case '+':
        setState(() {
          result = firstNumber + secondNumber;
        });
        break;
      case '-':
        setState(() {
          result = firstNumber - secondNumber;
        });
        break;
      case '*':
        setState(() {
          result = firstNumber * secondNumber;
        });
        break;
      case '/':
        setState(() {
          result = firstNumber / secondNumber;
        });
        break;
    }
  }
}