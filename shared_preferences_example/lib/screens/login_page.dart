import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>  _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async{
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    if (username == 'user' && password == 'pass'){
      await SharedPrefs.setLoginStatus(true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
    } else {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:const Text('Erro'),
          content: const Text('Credenciais inválidas'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
              ),
          ],
        ),
      );
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,            
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, 
                child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        );
      }
    }