import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/controllers/location_controller.dart';
import 'package:flutter_application_1/ui/pages/ubicacion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseLocation extends Mock implements FirebaseDatabase{}

class MockLocationController extends Mock implements LocationController{}

void main(){

  //final MockFirebaseLocation mockFirebaseLocation = MockFirebaseLocation();
  final MockLocationController mockLocationController = MockLocationController();

  setUp(() {});
  tearDown(() {});

  Future<String> envioUbicacion(String text, String latitud, String longitud) async {
    var databaseReference = FirebaseDatabase.instance.reference();
    try {
      databaseReference
          .child("Ubicaciones")
          .push()
          .set({
            'user': 'test@gmail.com',
           'latitud': latitud,
           'longitud':longitud
           });
        return "success"; 
    } catch (error) {
      return error.toString();
    }
  }

  test("enviar ubicación", () async {
     when(
      envioUbicacion("test", "111.2344545", "222.2345455")
    ).thenAnswer((realInvocation)=> throw FirebaseException(plugin: "",message: "No se envio ubicacion", code: 'unknown'));
    expect(mockLocationController.sendUbicacion("test", "111.2344545", "222.2345455"), "error");
    
  });

  testWidgets("widget de social", (WidgetTester tester) async {
    const ubicacion = Ubicacion();
    await tester.pumpWidget(ubicacion);

    expect(find.text("Latitud"), findsOneWidget);
    expect(find.text("Longitud"), findsOneWidget);
  });
}