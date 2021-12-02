import 'package:flutter_application_1/controllers/prueba.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  final prueba=Prueba();
    test("Pass", () {
      
      prueba.pass("1234");
      expect(prueba.getPass, "1234");
    });


  test("correo", () {
      prueba.correo("email");
      expect(prueba.getEmail, "email");
    });
    
}