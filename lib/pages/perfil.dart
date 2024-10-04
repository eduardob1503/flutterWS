import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPerfil(),
    );
  }
}

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Usa o contexto correto para abrir o Drawer
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.network(
              'https://via.placeholder.com/150', // URL do seu logo ou use Image.asset se estiver na pasta do projeto
              height: 100,
            ),
            ),
            ListTile(
              title: const Text('Meu Perfil'),
              onTap: () {
                // Ação ao clicar no Meu Perfil
              },
            ),
            ListTile(
              title: const Text('Ranking'),
              onTap: () {
                // Ação ao clicar no Ranking
              },
            ),
            ListTile(
              title: const Text('Matérias'),
              onTap: () {
                // Ação ao clicar em Matérias
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Ação ao clicar no Logout
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Perfil",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 50),
            Image.network(
              'https://via.placeholder.com/150',
              height: 100,
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nome Completo",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Cidade",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Curso",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: const Text(
                "Mudar Senha",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Atualizar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
