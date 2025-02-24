import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Halaman Utama - $username'), // Tambahkan nama user di header
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/'); // Logout ke login
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang, $username!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Anda telah berhasil masuk ke halaman utama.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
<<<<<<< HEAD
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        // '/home': (context) => const HomePage(),
      },
=======
>>>>>>> dc4dd2b1f1765446242e1bd07db8b7d566cacd22
    );
  }
}
