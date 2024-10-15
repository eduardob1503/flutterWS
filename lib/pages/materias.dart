import 'package:flutter/material.dart';

class Materias extends StatelessWidget{
  const Materias ({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: TelaMaterias(),
    );
  }
}

class TelaMaterias extends StatelessWidget{
  const TelaMaterias ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: (){

            }, 
            );
          }
        ),
      ),
    );
  }
}