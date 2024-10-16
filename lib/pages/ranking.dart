import 'package:flutter/material.dart';
import 'package:ws_project/pages/materias.dart';
import 'package:ws_project/pages/perfil.dart';

class Ranking extends StatelessWidget{
  const Ranking ({super.key});
  
  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      home: TelaRanking(),
    );
  }
}

class TelaRanking extends StatelessWidget{
  const TelaRanking ({super.key});

  @override
  Widget build(BuildContext context){
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

      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Center(
              child: Text(
                "Ranking - Paraná",
                style: TextStyle(
                ),
                textAlign: TextAlign.center, 
              ),    
            )       
          ],
        ),
      ),
    );
  }
}