import 'package:flutter/material.dart';
import 'package:ws_project/pages/cadastro.dart';
import 'package:ws_project/main.dart';
import 'package:local_auth/local_auth.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;
  bool _canCheckBiometrics = false;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  // Verificar se o dispositivo suporta biometria
  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  // Autenticar com biometria
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Autentique-se para continuar',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print(e);
    }
    setState(() {
      _isAuthenticated = authenticated;
      if (_isAuthenticated) {
        // Aqui você pode colocar a navegação para a próxima página
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Autenticado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falha na autenticação!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaCadastro()),
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
              'https://via.placeholder.com/150', // Substituir com o caminho da sua imagem
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
              obscureText: true, // Oculta o texto da senha
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // Troca de página
                },
                child: const Text(
                  'recuperar senha',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botão "Entrar" com autenticação biométrica
            ElevatedButton(
              onPressed: _canCheckBiometrics
                  ? _authenticate
                  : null, // Chama a autenticação biométrica
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: const Text('Entrar usando Impressão Digital'),
            ),
            const SizedBox(height: 20),

            // Exibe o status de autenticação
            Text(_isAuthenticated
                ? 'Autenticado com sucesso!'
                : 'Não autenticado'),
          ],
        ),
      ),
    );
  }
}
