import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/'); // Logout ke login
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Selamat datang di halaman utama!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
