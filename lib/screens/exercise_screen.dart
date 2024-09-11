import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  final String moduleName;

  ExerciseScreen({required this.moduleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios de $moduleName'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('2 + 4 = ?', style: TextStyle(fontSize: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('6')),
              ElevatedButton(onPressed: () {}, child: Text('8')),
            ],
          )
        ],
      ),
    );
  }
}
