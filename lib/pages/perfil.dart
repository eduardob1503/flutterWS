import 'package:flutter/material.dart';
import 'package:ws_project/pages/materias.dart';
import 'package:ws_project/pages/ranking.dart';
import 'package:ws_project/pages/splash.dart';
import 'cadastro.dart';

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
        backgroundColor: Colors.white,
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


            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1
              ),
              ),
            
            child: ListTile(
              tileColor: const Color.fromARGB(255, 0, 0, 0),
              title: const Center(
                child: const Text(
                  'Meu Perfil',
                  style: TextStyle (color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                
                ),
              onTap: () {
                // Ação ao clicar no Meu Perfil
              },
            ),
            ),
            
            

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1
                )
              ),
              child: ListTile(
              
              tileColor: Colors.white,
              title: const Center(
              child: const Text('Ranking'),
              ),
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaRanking(),
                    )
                  );
              },
            ),
            ),
            
            
            
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1
                )
              ),
              child: ListTile(
                tileColor: Colors.white,
                title: const Center(
                  child: const Text('Matéria'),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> const TelaMaterias(),
                      )
                  );
                },
              ),
            ),


            SizedBox(height: 450),
            ElevatedButton(
              child: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                

              ),
              
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaInicio(),
                    )
                  );
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
