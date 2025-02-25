import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      if (UserStorage.validateUser(username, password)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Username sudah digunakan! Silakan pilih yang lain.')),
        );
        return;
      }

      UserStorage.addUser(username, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registrasi berhasil! Silakan login.')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            'Simple Math App',
            style: TextStyle(
                color: Color.fromARGB(255, 106, 40, 160),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                decoration: const InputDecoration(
                    labelText: 'Nama Pengguna', border: OutlineInputBorder()),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harap masukkan nama pengguna';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harap masukkan kata sandi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Kata Sandi',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isConfirmPasswordVisible,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harap masukkan konfirmasi kata sandi';
                  } else if (value != _passwordController.text) {
                    return 'Konfirmasi kata sandi tidak cocok';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(onPressed: _register, child: const Text('Daftar')),
            ],
          ),
        ),
      ),
    );
  }
}
