import 'package:flutter/material.dart';
import 'package:ws_project/biometric/biometric_service.dart';
import 'package:ws_project/pages/materias.dart';
import 'package:ws_project/pages/cadastro.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final BiometricService _bioService = BiometricService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _authenticateWithBiometrics();
  }

  Future<void> _authenticateWithBiometrics() async {
    setState(() => _isLoading = true);
    bool authenticated = await _bioService.authenticate();
    setState(() => _isLoading = false);
    if (authenticated) navigateToMaterias();
  }

  void navigateToMaterias() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => TelaMaterias()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), backgroundColor: Colors.grey),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  SizedBox(height: 32),
                  _buildTextField('Email'),
                  SizedBox(height: 16),
                  _buildTextField('Senha', isPassword: true),
                  SizedBox(height: 16),
                  _buildLoginButton(),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TelaCadastro())),
                    child: Text('Criar conta'),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildLogo() => FlutterLogo(size: 100);

  Widget _buildTextField(String label, {bool isPassword = false}) => TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      );

  Widget _buildLoginButton() => ElevatedButton(
        onPressed: _authenticateWithBiometrics,
        child: Text('Entrar'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(double.infinity, 50)),
      );
}
