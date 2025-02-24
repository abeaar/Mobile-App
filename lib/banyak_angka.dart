import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BanyakAngka extends StatefulWidget {
  const BanyakAngka({super.key});

  @override
  _BanyakAngkaState createState() => _BanyakAngkaState();
}

class _BanyakAngkaState extends State<BanyakAngka> {
  final TextEditingController _controller = TextEditingController();

  void checkNumber() {
    String inputUser = _controller.text;
    if (inputUser.isEmpty) return;

    int count = inputUser.length;
    String message = "Jumlah angka: $count";

    // Munculkan Alert Dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Hasil",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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

    // Kosongkan input setelah submit
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cek Jumlah Angka",
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
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan angka",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: checkNumber,
              icon: Icon(Icons.check, color: Colors.white),
              label: Text(
                "Hitung",
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

// void main() {
//   runApp(MaterialApp(
//     home: GanjilGenap(),
//   ));
// }