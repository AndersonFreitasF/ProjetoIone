import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'progress_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final currentUser = authService.currentUser; // Pega o usuário autenticado

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nome: ${currentUser?.displayName ?? 'Usuário Anônimo'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${currentUser?.email ?? 'Email não disponível'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProgressScreen()), // Tela de progresso
                );
              },
              child: Text('Ver Progresso'),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
  onPressed: () async {
    await authService.signOut(); // Faz o logout do usuário
    Navigator.popUntil(context, ModalRoute.withName('/'));
  },
  child: Text('Sair'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red, // Define a cor de fundo do botão
  ),
),
            ),

          ],
        ),
      ),
    );
  }
}
