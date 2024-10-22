import 'package:local_auth/local_auth.dart';
import 'dart:async';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      // Adiciona um pequeno atraso para garantir que a tela esteja renderizada
      await Future.delayed(Duration(milliseconds: 300));
      
      return await _auth.authenticate(
        localizedReason: 'Autentique para acessar o app',
        options: const AuthenticationOptions(stickyAuth: true),
      );
    } catch (e) {
      print('Erro na autenticação biométrica: $e');
      return false;
    }
  }
}
