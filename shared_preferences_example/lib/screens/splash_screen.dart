import 'package:flutter/material.dart';
import '../utils/shared_prefs.dart';
import 'login_page.dart';
import 'home_page.dart';

  class SplashScreen extends StatefulWidget {
    const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  // o estado da splashscreen

  @override
  void initState(){
    super.initState();
    _checkLoginStatus(); // faz a verificação ao iniciar
  }

  Future <void> _checkLoginStatus() async {
    bool isLoggeIn =
      await SharedPrefs.getLoginStatus();
    if(isLoggeIn){
      // caso estiver logado, vai para a homepage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      //caso não estiver lopgado, vai para a página de login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        );
    }
  }
    @override
  Widget build(BuildContext context) {
    // exibe uma tela de carregamento enquanto verifica o login
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}