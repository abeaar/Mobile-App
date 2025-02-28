import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String userInput = '';
  String answer = '0';

  final List<String> buttons = [
    'C', '', '', 'DEL',
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    '0', '.', '=', '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kalkulator",
          style: TextStyle(
            color: Color.fromARGB(255, 106, 40, 160),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      // backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Display Area
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userInput,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      answer,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Buttons Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return buildButton(buttons[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text) {
    bool isOp = isOperator(text);
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () => onButtonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: isOp ? const Color.fromARGB(255, 106, 40, 160) : Colors.white,
          padding: const EdgeInsets.all(15),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          shadowColor: Colors.black12,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isOp ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        userInput = '';
        answer = '0';
      } else if (buttonText == 'DEL') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else if (buttonText == '=') {
        calculateResult();
      } else {
        userInput += buttonText;
      }
    });
  }

  void calculateResult() {
    try {
      String finalInput = userInput.replaceAll('x', '*');

      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        answer = eval.toString();
      });
    } catch (e) {
      setState(() {
        answer = "Error";
      });
    }
  }

  bool isOperator(String x) {
    return ['/', 'x', '-', '+', '='].contains(x);
  }
}
