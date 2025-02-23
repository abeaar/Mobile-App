import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 40, 160), // Warna sesuai dengan login
        title: Text(
          'Operasi Bilangan Sederhana - $username',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pilih Menu Operasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kalkulator');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 106, 40, 160), // Sesuaikan warna
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Kalkulator'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu2');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 106, 40, 160), // Sesuaikan warna
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Menu 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu3');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 106, 40, 160), // Sesuaikan warna
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Menu 3'),
            ),
          ],
        ),
      ),
    );
  }
}
