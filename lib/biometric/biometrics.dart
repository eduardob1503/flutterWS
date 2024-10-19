import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste/biometric/biometric_block.dart';

import 'biometric_data.dart';

class Biometrics extends StatefulWidget {
  @override
  State<Biometrics> createState() => _BiometricsState();
}

class _BiometricsState extends State<Biometrics> {
  BiometricBloc bioBloc = BiometricBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bioBloc.biometric,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        BiometricData data = snapshot.data as BiometricData;

        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Device suporta biometria?"),
                  const Spacer(),
                  Text(data.isDeviceSupported ? "Sim" : "Não")
                ],
              ),
              Row(
                children: [
                  const Text("Está autenticando?"),
                  const Spacer(),
                  Text(data.isAuthenticating ? "Sim" : "Não")
                ],
              ),
              Row(
                children: [
                  const Text("Está autorizado?"),
                  const Spacer(),
                  Text(data.authorized ?? "Não autorizado")
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => bioBloc.checkDevice(),
                    child: const Text("Verificar se o device é suportado"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => bioBloc.authenticate(),
                    child: const Text("Autenticar"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}