import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseService with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Pega o progresso do usuário atual do Firestore
  Future<Map<String, dynamic>?> getUserProgress() async {
    try {
      // Obtém o usuário atual
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        return null;
      }

      // Busca o documento do progresso do usuário pelo UID
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _db.collection('progress')
          .doc(currentUser.uid)
          .get();

      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao buscar progresso do usuário: $e');
      throw e;
    }
  }

  // Salva o progresso do usuário
  Future<void> saveUserProgress(Map<String, dynamic> progressData) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) return;

      // Salva os dados de progresso no Firestore
      await _db.collection('progress').doc(currentUser.uid).set(progressData);
      notifyListeners();
    } catch (e) {
      print('Erro ao salvar progresso: $e');
      throw e;
    }
  }
}
