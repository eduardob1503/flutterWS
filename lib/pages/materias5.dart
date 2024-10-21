import 'package:flutter/material.dart';
import 'package:ws_project/pages/login.dart';

class TelaMateria5 extends StatelessWidget{
  const TelaMateria5({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(16),
          child: _buildMateriaCard(index),
        ),
      ),
    );
  }
}

Widget _buildMateriaCard(index){
  return Card(
    child: SizedBox(
      height: 140,
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              "Nome da Materia ${index +1}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              child: Text("Acessar"),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildDrawer(BuildContext context){
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          child: Column(
            children: const [
              Icon(Icons.account_circle, size: 80),
              SizedBox(height: 10),
            ],
          ),
        ),
        const Spacer(),
        ListTile(
          leading: Icon(Icons.logout),
          title: const Text("Log out"),
          onTap: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreen()) 
            );
          },
        )
      ],
    ),
  );
}