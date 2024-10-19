import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutterWS/biometric/biometric_data.dart';
import 'package:local_auth/local_auth.dart';

class BiometricBloc {
  final BiometricData _output = BiometricData();
  final StreamController _scBiometric = StreamController();
  final _auth = LocalAuthentication();

  get biometric => _scBiometric.stream;

  BiometricBloc(){
    _scBiometric.add(_output);
  }

  checkDevice() async{
     bool isDeviceSupported = await _auth.isDeviceSupported();
     _output.isDeviceSupported = isDeviceSupported;
     _scBiometric.add(_output);
  }

authenticate() async{
  try{
    _output.isAuthenticating = true;
    _scBiometric.add(_output);

    bool authenticated = await _auth.authenticate(
      localizedReason: "Autentificação", 
      options: const AuthenticationOptions(
        stickyAuth: true,
      ));
      _output.authorized = authenticated ? "Autorizado" : "Não Autorizado";
      _output.isAuthenticating = false;
      _scBiometric.add(_output);
  }
  on PlatformException catch(e){
    _output.authorized = "Erro ao Autenticar";
    _output.isAuthenticating = false;
    _scBiometric.add(_output);
    print(e);
  }
}


cancelAuthentication() async{
  _auth.stopAuthentication();
}

  dispose(){
    _scBiometric.close();
  }
}