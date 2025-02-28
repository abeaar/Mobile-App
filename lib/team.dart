import 'package:flutter/material.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Tim Kami',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 106, 40, 160)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTeamMember(
              name: 'Abraar Jihaad Hibatullah',
              role: 'Login dan Register',
              bio: '123220109',
              imagePath: 'assets/images/Abraar.JPG',
            ),
            const SizedBox(height: 20),
            _buildTeamMember(
              name: 'Arif Faturrahman',
              role: 'Kalkulator dan Home',
              bio: '123220136',
              imagePath: 'assets/images/Arif.JPG',
            ),
            const SizedBox(height: 20),
            _buildTeamMember(
              name: 'Nandisya Faiz Efendi',
              role: 'Ganjil Genap dan Banyak Angka',
              bio: '123220139',
              imagePath: 'assets/images/Faiz.JPG',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String bio,
    required String imagePath,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            bio,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
