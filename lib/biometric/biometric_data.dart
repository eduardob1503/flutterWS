import 'package:local_auth/local_auth.dart';

class BiometricData{
  bool? canCheckBiometrics;
  List<BiometricType>? avaliableBiometrycs;
  String? authorized;
  bool isAuthenticating = false;
  bool isDeviceSupported = false;

  BiometricData(
    {
      this.canCheckBiometrics,
      this.avaliableBiometrycs,
      this.authorized,
      this.isAuthenticating = false,
      this.isDeviceSupported = false
    }
  );
}