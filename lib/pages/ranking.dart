import 'package:flutter/material.dart';

class TelaRanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Parte estática superior
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
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
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.person, color: Colors.purple),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text('Aluno ${index + 1}'),
                      ),
                      Text(
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