import 'package:flutter/material.dart';
import 'module_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathEasy - Módulos de Matemática'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Frações'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ModuleScreen(moduleName: 'Frações')));
            },
          ),
          ListTile(
            title: Text('Soma'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ModuleScreen(moduleName: 'Soma')));
            },
          ),
          // Adicionar outros módulos conforme necessário
        ],
      ),
    );
  }
}
