import 'package:flutter/material.dart';

import 'home.dart';
import 'kalkulator.dart';
import 'login.dart';
import 'registrasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1 TPM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            if (settings.arguments is String) {
              final String username = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => HomePage(username: username),
              );
            }
            return MaterialPageRoute(
              builder: (context) => const ErrorPage(),
            );
          default:
            return null;
        }
      },
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(username: 'User'),
        '/kalkulator': (context) => const KalkulatorPage(),
      },
    );
  }
}

// Buat halaman error jika argument salah
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Terjadi kesalahan dalam navigasi.')),
    );
  }
}
