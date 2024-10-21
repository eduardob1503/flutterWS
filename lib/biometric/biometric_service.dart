import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
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
