import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/data/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth{
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

void main(){

  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final AuthService authService = AuthService(auth: mockFirebaseAuth);

  setUp(() {});
  tearDown(() {});

  test("emitir ocurrencia", () async {
    expectLater(authService.auth, emitsInOrder([_mockUser]));
  });

  test("crear una cuenta con exception", () async {
    
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(email: "test@gmail.com", password: "12345678"),
    ).thenAnswer((realInvocation) => throw FirebaseAuthException(message: "No se pudo crear la cuenta", code: 'email-already-in-use'));

    expect(authService.signUp("test@gmail.com", "12345678"), "Success");
  });

  test("login con exception", () async {
    
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(email: "correo@gmail.com", password: "12345678"),
    ).thenAnswer((realInvocation) => throw FirebaseAuthException(message: "No se pudo loguear", code: 'user-not-found'));

    expect(authService.login("correo@gmail.com", "12345678"), "Success");
  });

  test("Cerrar sesion", () async {
    
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((realInvocation) => throw FirebaseAuthException(message: "No se pudo cerrar sesion", code: ''));

    expect(authService.logOut(), "Success");
  });

  // testWidgets("widget de social", (WidgetTester tester) async {
  //   final Social social = Social();
  //   await tester.pumpWidget(social);
  // });
}