import 'package:flutter/material.dart';
import 'package:ws_project/pages/cadastro.dart';
import 'package:ws_project/pages/login.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaInicio(),
    );
  }
}

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("Bem-Vindo!!!"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              const Center(
                child: Text(
                  "Bem Vindo",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                  child: Text(
                      "A AprendaS é uma plataforma que transforma o aprendizado em uma experiência divertida e gamificada, oferecendo bônus e vantagens exclusivas para os alunos que se destacam no ranking estadual",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black))),
              const SizedBox(height: 80),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                  ),
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
