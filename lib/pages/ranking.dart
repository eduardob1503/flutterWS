import 'package:flutter/material.dart';
import 'package:ws_project/pages/materias.dart';
import 'package:ws_project/pages/perfil.dart';





class TelaRanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder:(context) {
        return IconButton(
          onPressed: (){

            Scaffold.of(context).openDrawer();
          },
           icon: const Icon(Icons.menu)
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
              child: Image.network("https://via.placeholder.com/150",
              height:100,
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
              tileColor: const Color.fromARGB(255, 255, 255, 255),
              title: const Center(
                child: Text("Meu Perfil",
                style: TextStyle(color: Colors.black),
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaPerfil(),
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
              tileColor: const Color.fromARGB(255, 0, 0, 0),
              title: const Center(
                child: Text(
                  "Ranking",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              onTap: (){

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
              tileColor: const Color.fromARGB(255, 252, 252, 252),
              title: const Center(
                child: Text(
                  "Matéria",
                style: TextStyle(color: Colors.black),
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaMaterias(),
                    )
                  );
              },
            ),
            ),



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
                Icon(Icons.arrow_upward, size: 40),
                SizedBox(height: 8),
                Text(
                  'Ranking - Paraná',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Lista rolável de rankings
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Número de itens no ranking
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}.',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.person, color: Colors.purple),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text('Aluno ${index + 1}'),
                      ),
                      const Text(
                        '3685pts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}