import 'package:flutter/material.dart';

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
        leading: IconButton(
          onPressed: (){

          },
         icon: const Icon(Icons.menu)
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