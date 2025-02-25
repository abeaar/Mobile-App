import 'package:flutter/material.dart';

// Simpan daftar user secara hardcoded
class UserStorage {
  static final List<Map<String, String>> _users = [
    {'username': 'admin', 'password': '12345'} // Akun admin dummy
  ];

  static void addUser(String username, String password) {
    _users.add({'username': username, 'password': password});
  }

  static bool validateUser(String username, String password) {
    return _users.any(
        (user) => user['username'] == username && user['password'] == password);
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String inputUsername = _usernameController.text.trim();
      String inputPassword = _passwordController.text.trim();

      if (UserStorage.validateUser(inputUsername, inputPassword)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login berhasil!')),
        );

        // Navigasi ke halaman home dengan username sebagai argumen
        Navigator.pushReplacementNamed(context, '/home',
            arguments: inputUsername);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Login gagal! Username atau password salah')),
        );
      }
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person1.jpg'),
                  radius: 100,
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengguna',
                    border: OutlineInputBorder(),
                  ),
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
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Harap masukkan kata sandi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Masuk'),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    if (ModalRoute.of(context)?.settings.name != '/register') {
                      Navigator.pushNamed(context, '/register');
                    }
                  },
                  child: const Text('Belum punya akun? Daftar di sini'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
