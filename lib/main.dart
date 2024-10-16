import 'package:flutter/material.dart';
import 'package:ws_project/pages/cadastro.dart';
import 'package:ws_project/pages/login.dart';
import 'package:ws_project/pages/materias.dart';
import 'package:ws_project/pages/splash.dart'; // Certifique-se de importar suas outras páginas
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Inicie pelo SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Aguarde 3 segundos e, em seguida, navegue para a tela inicial
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaMaterias()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Substitua pelo seu logo
            Image.asset(
              'Png.png', // URL do seu logo ou use Image.asset se estiver na pasta do projeto
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo ao Meu App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
