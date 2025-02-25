import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    final String username = (args is String) ? args : "Guest";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
            'Welcome $username',
            style: const TextStyle(
                color: Color.fromARGB(255, 106, 40, 160),
                fontWeight: FontWeight.bold),
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
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Pilih Menu Operasi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 106, 40, 160),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  _buildMenuButton(
                      context, 'Kalkulator', '/kalkulator', Icons.calculate),
                  const SizedBox(height: 20),
                  _buildMenuButton(context, 'Ganjil atau Genap',
                      '/ganjil_genap', Icons.format_list_numbered),
                  const SizedBox(height: 20),
                  _buildMenuButton(
                      context, 'Banyak Angka', '/banyak_angka', Icons.numbers),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildMenuButton(
      BuildContext context, String label, String route, IconData icon) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 106, 40, 160),
          padding: const EdgeInsets.symmetric(vertical: 15),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white), // Tambahkan ikon di sini
            const SizedBox(width: 10), // Beri jarak antara ikon dan teks
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
