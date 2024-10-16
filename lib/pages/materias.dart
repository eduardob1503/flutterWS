import 'package:flutter/material.dart';
import 'package:ws_project/pages/ranking.dart';
import 'perfil.dart';

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
}