import 'package:flutter/material.dart';
import 'package:ws_project/pages/ranking.dart';
import 'perfil.dart';

class TelaMaterias extends StatelessWidget {
  const TelaMaterias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.network(
                'https://via.placeholder.com/150',
                height: 100,
              ),
            ),
            _buildDrawerItem(context, "Meu Perfil", TelaPerfil()),
            _buildDrawerItem(context, "Ranking", TelaRanking()),
            _buildDrawerItem(context, "Matéria", const TelaMaterias()),
          ],
        ),
      ),
      body: Column(
        children: [
          // Parte estática superior
          Container(
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                Icon(Icons.book, size: 40),
                SizedBox(height: 8),
                Text(
                  'Materias',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Lista rolável de matérias
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Número de matérias
              itemBuilder: (context, index) {
                return _buildMateriaCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir o card de cada matéria
  Widget _buildMateriaCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Botão de acesso (canto inferior direito)
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                child: const Text('Acessar'),
                onPressed: () {
                  // Ação do botão de acesso
                },
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

  Widget _buildDrawerItem(BuildContext context, String title, Widget destination) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
