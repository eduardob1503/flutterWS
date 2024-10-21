import 'package:flutter/material.dart';
import 'package:ws_project/biometric/biometric_block.dart';
import 'package:ws_project/pages/materias.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final BiometricBloc _bioBloc = BiometricBloc();
  int _failedAttempts = 0;

  @override
  void initState() {
    super.initState();
    _checkBiometricSupport();
  }

  Future<void> _checkBiometricSupport() async {
    await _bioBloc.checkDevice();
    if (_bioBloc.biometric.value.isDeviceSupported && _failedAttempts < 3) {
      _authenticate();
    } else {
      _showManualLoginMessage();
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = await _bioBloc.authenticate();
    if (authenticated) {
      // Navegar para a tela de matérias quando a biometria for bem-sucedida
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaMaterias()),
      );
    } else {
      setState(() => _failedAttempts++);
      if (_failedAttempts == 3) _showManualLoginMessage();
    }
  }

  void _showManualLoginMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Falha na biometria. Use e-mail e senha.")),
    );
  }
void _onLoginPressed() {
    if (_failedAttempts < 3) {
      _authenticate();
    } else {
      // Validação manual de login e navegação para a tela de matérias
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaMaterias()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
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
            _buildTextButton('Recuperar senha'),
            SizedBox(height: 16),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() => Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('S', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 8),
          Text('appsala', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      );

  Widget _buildTextField(String label, {bool isPassword = false}) => TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      );

  Widget _buildTextButton(String label) => TextButton(
        onPressed: () {},
        child: Text(label, style: TextStyle(color: Colors.grey)),
      );

  Widget _buildLoginButton() => ElevatedButton(
        onPressed: _onLoginPressed,
        child: Text('Entrar'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size(double.infinity, 50),
        ),
      );
}
