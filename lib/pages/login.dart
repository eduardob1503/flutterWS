import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ws_project/pages/cadastro.dart';
import 'package:ws_project/pages/splash.dart';
import 'package:ws_project/pages/perfil.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaInicio()),
            );
          },
        ),
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.network(
              'https://via.placeholder.com/150',
              height: 100,
            ),
            const SizedBox(height: 30),

            // Campo de e-mail
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo de senha
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),

            // Botão recuperar senha
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaPerfil(),
                    ),
                  );
                },
                child: const Text(
                  'Recuperar senha',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botão "Entrar" com biometria e senha
            ElevatedButton(
              onPressed: (){
                
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: const Text('Entrar'),
            ),

            const SizedBox(height: 20),

            // Exibe o status de autenticação
          ],
        ),
      ),
    );
  }
}
