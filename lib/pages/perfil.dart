import 'package:flutter/material.dart';
import 'package:ws_project/pages/materias.dart';
import 'package:ws_project/pages/ranking.dart';
import 'package:ws_project/pages/splash.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Perfil', style: TextStyle(color: Colors.black)),
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Image.network('https://via.placeholder.com/150', height: 100),
          ),
          _buildDrawerItem('Meu Perfil', Colors.black, Colors.white, () {}),
          _buildDrawerItem('Ranking', Colors.white, Colors.black, () => Navigator.push(context, MaterialPageRoute(builder: (_) => TelaRanking()))),
          _buildDrawerItem('Matéria', Colors.white, Colors.black, () => Navigator.push(context, MaterialPageRoute(builder: (_) => TelaMaterias()))),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SplashScreen())),
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, Color bgColor, Color textColor, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
        tileColor: bgColor,
        title: Center(child: Text(title, style: TextStyle(color: textColor))),
        onTap: onTap,
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Image.network('https://via.placeholder.com/150', height: 100),
          SizedBox(height: 30),
          _buildTextField("Nome Completo"),
          SizedBox(height: 16),
          _buildTextField("Cidade"),
          SizedBox(height: 16),
          _buildTextField("Curso"),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text("Mudar Senha", style: TextStyle(color: Colors.black)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text("Atualizar", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
