import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Getter para pegar o usuário atual
  User? get currentUser => _auth.currentUser;

  // Login com email e senha
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      print('Erro ao fazer login: $e');
      throw e;
    }
  }

  // Cadastro de novo usuário (signUp)
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      print('Erro ao cadastrar: $e');
      throw e;
    }
  }

  // Logout do usuário
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      print('Erro ao sair: $e');
    }
  }

  // Redefinição de senha
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Erro ao enviar email de recuperação: $e');
      throw e;
    }
  }
}
