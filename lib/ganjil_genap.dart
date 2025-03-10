import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GanjilGenap extends StatefulWidget {
  const GanjilGenap({super.key});

  @override
  _GanjilGenapState createState() => _GanjilGenapState();
}

class _GanjilGenapState extends State<GanjilGenap> {
  final TextEditingController _controller = TextEditingController();

  void checkNumber() {
    String inputUser = _controller.text;
    if (inputUser.isEmpty) return;

    int? number = int.tryParse(inputUser);
    if (number == null) return;

    String message = (number % 2 == 0) ? "Angka Genap" : "Angka Ganjil";

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

    // Kosongkan input setelah submit (opsional)
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cek Ganjil Genap",
          style: TextStyle(fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 106, 40, 160)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _controller, // Tambahkan controller di sini
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
            SizedBox(height: 20), // Tambahkan jarak biar UI lebih rapi
            ElevatedButton.icon(
              onPressed: checkNumber,
              icon:
                  Icon(Icons.check, color: Colors.white), // Tambahin icon check
              label: Text(
                "Check",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Warna teks
                backgroundColor: const Color.fromARGB(255, 106, 40, 160), // Warna background
                padding: EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // Ukuran padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Bikin rounded button
                ),
                elevation: 5, // efek shadow
              ),
            ),
          ],
        ),
      ),
    );
  }
}