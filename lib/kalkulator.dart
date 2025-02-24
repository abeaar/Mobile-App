import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  _KalkulatorPageState createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _output = "0"; // Menampilkan hasil kalkulasi
  String _input = ""; // Input angka yang diketik
  String _operator = ""; // Operator yang dipilih
  double _previousValue = 0; // Nilai sebelumnya untuk operasi

  void _appendToInput(String value) {
    setState(() {
      if (_input == "0" && value != '.') {
        _input = value;
      } else {
        _input += value;
      }
    });
  }

  void _clear() {
    setState(() {
      _input = "";
      _output = "0";
      _operator = "";
      _previousValue = 0;
    });
  }

  void _calculate() {
    double currentValue = double.tryParse(_input) ?? 0;
    setState(() {
      switch (_operator) {
        case 'tambah':
          _output = (_previousValue + currentValue).toString();
          break;
        case 'kurang':
          _output = (_previousValue - currentValue).toString();
          break;
        case 'kali':
          _output = (_previousValue * currentValue).toString();
          break;
        case 'bagi':
          if (currentValue == 0) {
            _output = "Error"; // Avoid division by zero
          } else {
            _output = (_previousValue / currentValue).toString();
          }
          break;
        default:
          _output = _input;
      }
      _input = "";
      _operator = "";
      _previousValue = 0;
    });
  }

  void _setOperator(String operator) {
    setState(() {
      if (_input.isNotEmpty) {
        _previousValue = double.tryParse(_input) ?? 0;
      }
      _input = "";
      _operator = operator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 40, 160),
        title: const Text('Kalkulator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Output display
            Text(
              _input.isEmpty ? _output : _input,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            // Number and operator buttons
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildButton('7');
                } else if (index == 1) {
                  return _buildButton('8');
                } else if (index == 2) {
                  return _buildButton('9');
                } else if (index == 3) {
                  return _buildOperatorButton('/', 'bagi');
                } else if (index == 4) {
                  return _buildButton('4');
                } else if (index == 5) {
                  return _buildButton('5');
                } else if (index == 6) {
                  return _buildButton('6');
                } else if (index == 7) {
                  return _buildOperatorButton('×', 'kali');
                } else if (index == 8) {
                  return _buildButton('1');
                } else if (index == 9) {
                  return _buildButton('2');
                } else if (index == 10) {
                  return _buildButton('3');
                } else if (index == 11) {
                  return _buildOperatorButton('-', 'kurang');
                } else if (index == 12) {
                  return _buildButton('0');
                } else if (index == 13) {
                  return _buildOperatorButton('=', 'equals');
                } else if (index == 14) {
                  return _buildOperatorButton('+', 'tambah');
                } else {
                  return _buildButton('C', clear: true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Button Number
  Widget _buildButton(String text, {bool clear = false}) {
    return ElevatedButton(
      onPressed: () {
        if (clear) {
          _clear();
        } else {
          _appendToInput(text);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 24),
        backgroundColor: Colors.black,
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  // Operator Button
  Widget _buildOperatorButton(String symbol, String operation) {
    return ElevatedButton(
      onPressed: () {
        if (operation == 'equals') {
          _calculate();
        } else {
          _setOperator(operation);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        textStyle: const TextStyle(fontSize: 24),
        backgroundColor: Colors.blue,
      ),
      child: Text(symbol, style: const TextStyle(color: Colors.white)),
    );
  }
}
