import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';
import 'login_page.dart';

  class HomePage extends StatelessWidget {
  const HomePage({super.key});


  Future<void> _logout(BuildContext context) async {
    await SharedPrefs.removeLoginStatus();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal', style: TextStyle(color: Colors.red)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            ),
        ],
      ),
      body: const Center(
       child: Text(
        'Bem-vindo!',
        style: TextStyle(fontSize: 24, color: Colors.red),
       ),
      ),
    );
  }
}