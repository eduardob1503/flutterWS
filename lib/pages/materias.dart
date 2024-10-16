import 'package:flutter/material.dart';

class TelaMaterias extends StatelessWidget {
  const TelaMaterias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar com menu e pesquisa
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // Lista de matérias
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(16),
          child: _buildMateriaCard(index),
        ),
      ),
    );
  }

  // Método para construir o card de cada matéria
  Widget _buildMateriaCard(int index) {
    return Card(
      child: SizedBox(
        height: 140, // Altura fixa de 140px
        child: Stack(
          children: [
            // Nome da matéria (canto superior esquerdo)
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                'Nome da Matéria ${index + 1}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Botão de acesso (canto inferior direito)
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                child: Text('Acessar'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}