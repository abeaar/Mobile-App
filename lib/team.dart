import 'package:flutter/material.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Our Member',
              style: TextStyle(
                  color: Color.fromARGB(255, 106, 40, 160),
                  fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 47, vertical: 20)),
            const SizedBox(height: 20),
            _buildTeamMember(
                name: 'Arif Faturrahman',
                role: 'Kalkulator dan Home',
                bio: '123220136',
                imagePath: 'assets/images/Arif.JPG',
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
            const SizedBox(height: 20),
            _buildTeamMember(
                name: 'Nandisya Faiz Efendi',
                role: 'Ganjil Genap dan Banyak Angka',
                bio: '123220139',
                imagePath: 'assets/images/Faiz.JPG',
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
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
    required EdgeInsets padding,
  }) {
    return Card(
      color: const Color.fromARGB(255, 145, 82, 196),
      elevation: 4, // Memberikan efek bayangan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Membuat sudut membulat
      ),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              role,
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Text(
              bio,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}
