// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth auth;

  AuthService({
    required this.auth,
  });

  Stream<User?> get user => auth.authStateChanges();


  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  Future<String> login(theEmail, thePassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: theEmail, password: thePassword);
      if (userCredential!=null) {
        return "Success";
      }else{
        return "Failed";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error("Usuario no encontrado");
      } else if (e.code == 'wrong-password') {
        return Future.error("Contraseña equivocada");
      }else if (e.code == 'network-request-failed') {
        return Future.error("Error de conexion");
      }else{
        return Future.error("Error");
      }
    }
  }

  Future<String?> signUp(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('La cuenta ya existe para este email.');
      } else if (e.code == 'network-request-failed') {
        return Future.error('No hay conexión a internet.');
      }
    }
  }

  Future<String?> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "Success";
    } on FirebaseAuthException catch (e){
      return e.message;
    } catch (e) {
      rethrow;
    }
  }

  
}
