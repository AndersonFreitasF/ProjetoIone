import 'package:flutter/material.dart';
import 'exercise_screen.dart';

class ModuleScreen extends StatelessWidget {
  final String moduleName;

  ModuleScreen({required this.moduleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(moduleName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Aqui está a teoria sobre $moduleName.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExerciseScreen(moduleName: moduleName)));
              },
              child: Text('Começar Exercícios'),
            )
          ],
        ),
      ),
    );
  }
}
