// ignore_for_file: avoid_print, void_checks

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  //Crea el futuro para iniciar sesion, deben recibirse como params el email y contraseña
  // Future<void> login(theEmail, thePassword) async {}

  //Crea el futuro para el registro de nuevos usuarios, deben recibirse como params el email y contraseña
  // Future<void> signUp(email, password) async {}

  //Crea el futuro para cerrar sesion
  // Future<void> logOut() async {}

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  Future<void> login(theEmail, thePassword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: theEmail, password: thePassword);
      print('OK');
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('NOK 1');
        return Future.error("Usuario no encontrado");
      } else if (e.code == 'wrong-password') {
        print('NOK 2');
        return Future.error("Contraseña equivocada");
      }
    }
  }

  Future<void> signUp(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
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

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
