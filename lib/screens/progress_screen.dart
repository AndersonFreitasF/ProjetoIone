import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database_service.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbService = Provider.of<DatabaseService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Progresso'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: dbService.getUserProgress(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar progresso.'));
          }

          final progress = snapshot.data;

          if (progress == null) {
            return Center(child: Text('Nenhum progresso disponível.'));
          }

          // Casting para Map<String, dynamic>
          final progressMap = progress;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nível: ${progressMap['level'] ?? 'N/A'}', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Conquistas:', style: TextStyle(fontSize: 16)),
                if (progressMap['achievements'] != null)
                  ...progressMap['achievements'].map<Widget>((achieve) => Text('• $achieve')).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
