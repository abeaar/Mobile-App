import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberChecker extends StatefulWidget {
  @override
  _NumberCheckerState createState() => _NumberCheckerState();
}

class _NumberCheckerState extends State<NumberChecker> {
  final TextEditingController _controller = TextEditingController();
  int totalNumbers = 0;

  void checkNumber() {
    String inputUser = _controller.text;
    if (inputUser.isEmpty) return;

    List<String> numbers = inputUser.split(',');
    totalNumbers = numbers.length;
    
    List<String> results = numbers.map((numStr) {
      int? number = int.tryParse(numStr.trim());
      if (number == null) return "$numStr (Invalid)";
      return "$numStr: " + (number % 2 == 0 ? "Genap" : "Ganjil");
    }).toList();

    String message = results.join('\n');
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Hasil ($totalNumbers angka)",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          )
        ],
      ),
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cek Banyak Angka",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.purple),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d|,')),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan angka (pisahkan dengan koma)",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: checkNumber,
              icon: Icon(Icons.check, color: Colors.white),
              label: Text(
                "Check",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NumberChecker(),
  ));
}
