import 'package:flutter/material.dart';
import 'package:ws_project/pages/ranking.dart';
import 'perfil.dart';


class TelaMaterias extends StatelessWidget{
  const TelaMaterias ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // AppBar com menu e pesquisa
     appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context){
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: (){
            Scaffold.of(context).openDrawer();
            }, 
            );
          }
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
              'https://via.placeholder.com/150', // URL do seu logo ou use Image.asset se estiver na pasta do projeto
              height: 100,
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
              tileColor: const Color.fromARGB(255, 255, 255, 255),
              title: const Center(
                child: Text(
                  "Ranking",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              onTap: (){
Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaRanking(),
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
                  "Matéria",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
      )
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Botão de acesso (canto inferior direito)
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                child: const Text('Acessar'),
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



