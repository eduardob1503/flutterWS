import 'package:ws_project/biometric/biometrics.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  late String _title;

  Home(this._title);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          ),
      ),
      body: Biometrics(),
    );
  }
}