import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ws_project/pages/cadastro.dart';
import 'package:ws_project/pages/splash.dart';
import 'package:ws_project/pages/perfil.dart';

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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

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

  Future<void> _authenticateOrLogin() async {
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
    
    if (!authenticated) {
      // Se não for autenticado com biometria, tenta login com email e senha
      _loginWithCredentials();
    } else {
      setState(() {
        _isAuthenticated = authenticated;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Autenticado com sucesso!')),
      );
      // Navegar para a próxima página
    }
  }

  void _loginWithCredentials() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Aqui você deve adicionar a lógica para validar o email e a senha
    if (email.isNotEmpty && password.isNotEmpty) {
      // Suponha que a autenticação foi bem-sucedida
      setState(() {
        _isAuthenticated = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );
      // Navegar para a próxima página
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
    }
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
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Campo de senha
            TextFormField(
              controller: _passwordController,
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
              onPressed: _authenticateOrLogin,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: const Text('Entrar'),
            ),

            const SizedBox(height: 20),

            // Exibe o status de autenticação
            Text(_isAuthenticated ? 'Autenticado com sucesso!' : 'Não autenticado'),
          ],
        ),
      ),
    );
  }
}
